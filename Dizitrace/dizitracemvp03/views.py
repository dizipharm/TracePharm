from django.shortcuts import render,redirect
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User,auth
from django.contrib.auth import authenticate
from django.contrib import messages
from tablib import Dataset
from .resources import PersonResource
from .models import bulk_upload
from .models import bulkdata
import folium
from branca.element import Figure
from . urlmapping import *
from django.core.paginator import Paginator #import Paginator
# import gmaps

import requests
from . forms import *
from . models import *
import json
# Create your views here.

# Dashboard for manufacturer result showing view

def dashboardview(request):
    result = requests.get(dashboard_url).json()
    # return render(request,'dashboard.html')
    return render(request,'dashboard.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result, 'res_token':request.session['email'] or ''})

def dashboard1view(request):
    # import pdb; pdb.set_trace()
    result1 = requests.get(po_intransitlist_url).json()
    result2=result1.get("transaction")
    # resultponotify=result1.get("transaction")
    resultponotify=result2[0]
    resultcount=requests.get(po_count_url).json()
    resultponotify.update(resultcount)
    # print(resultponotify)
    request.session['res'] = resultponotify,
    res_token=request.session['email']
    users=res_token[0]
    userid=users.get("id")
    result3 = requests.get(product_cart_item_count_url.format(userid)).json()
    resultcartcount=result3.get("cart_count")
    request.session['rescount'] = resultcartcount,
    return render(request,'dashboard_new.html',{'userid':userid,'resultponotify':request.session['res'],'resultcartcount':request.session['rescount'],'resultcount':resultcount,'res_token':request.session['email'] or ''})

def base_admin_dashboardview(request):
    return render(request,'base_admin_dashboard.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

# Mfg gtin+sscc track
def tracknewview(request,ssccid):
    # gnum = id
    # key=API_KEY='AIzaSyDpKbS4Rg3e7SxmoU0bG70EgB6_dwyAMbQ'
    ssccid=ssccid
    result = requests.get(tracknew_url.format(ssccid)).json()
    result0=result.get("track")
    # import pdb; pdb.set_trace()
    result1=result0.get("controll_conditions")
    result2=result1[0]
    result3=result2[0]
    temp1=result3.get("controll_condition")
    temp2=temp1.get("temperature")
    request.session['temp'] = temp2,
    # temp1=request.session['temp']
    # print(temp1)

    resultstatus=result0.get("status")
    resultstatus2=resultstatus[0]
    resultsta=resultstatus2.get("transaction_status")
    # print(resultsta)
    prostatus=resultsta.get("product_status")
    request.session['status'] = prostatus,
    pro=request.session['status']
    print(pro)
    resultpackage=result0.get("package_information")
    resultpackage1=resultpackage[0]
    resultlocation=result0.get("locations")
    resultentrylocation1=resultlocation[0][1]
    # print(resultentrylocation1)
    resultexitlocation2=resultlocation[0][2]
    # print(resultexitlocation2)
    resultcurrentlocation3=resultlocation[0][0]
    # print(resultcurrentlocation3)
    # resultlot=result0.get("lot_information")
    # resultlot1=resultlot[0]
    resultowner=result0.get("owner")
    resultentryowner=resultowner[0]
    resultcurrentowner=resultowner[1]
    resultexitowner=resultowner[2]
    # print(resultentryowner)
    # print(resultcurrentowner)
    # print(resultexitowner)

    resulttransaction=result0.get("transaction_event")
    resulttransaction2=resulttransaction[0]

    # print(resultentryowner)
    # print(resultcurrentowner)
    # print(resultexitowner)
    # print(resulttransaction2)


    result3.update(resultentryowner)
    result3.update(resultexitowner)
    result3.update(resultcurrentowner)
    result3.update(resulttransaction2)
    result3.update(result0)
    result3.update(resultentrylocation1)
    result3.update(resultexitlocation2)
    result3.update(resultcurrentlocation3)
    # result3.update(resultlot1)
    result3.update(resultstatus2)
    result3.update(resultpackage1)

    if resultstatus2['transaction_status']['transaction_status']=='PACKAGED':
        # print('packing',resultstatus2['transaction_status']['transaction_status'])
        entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        # print('received',currentlocation)
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        # folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        # print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,exitpoint], color="red",line_opacity = 0.5).add_to(m)
        # folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        return render(request,'tracknew.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'temp2':request.session['temp'] or '','prostatus':request.session['status'] or '','result':result3,'m': m,'ssccid':ssccid,'res_token':request.session['email'] or ''})

    elif resultstatus2['transaction_status']['transaction_status'] == 'SHIPPED':
        print('shiping',resultstatus2['transaction_status']['transaction_status'])
        entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        print(currentlocation)
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        # print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        return render(request,'tracknew.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'temp2':request.session['temp'] or '','prostatus':request.session['status'] or '','result':result3,'m': m,'ssccid':ssccid,'res_token':request.session['email'] or ''})

    elif resultstatus2['transaction_status']['transaction_status']=='HAND OFF':
        print('handoff',resultstatus2['transaction_status']['transaction_status'])
        entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        print('handof',currentlocation)
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 2)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'tracknew.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'temp2':request.session['temp'] or '','prostatus':request.session['status'] or '','result':result3,'m': m,'ssccid':ssccid,'res_token':request.session['email'] or ''})


    elif resultstatus2['transaction_status']['transaction_status']=='IN-TRANSIT':
        print('intransit',resultstatus2['transaction_status']['transaction_status'])
        entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        print('intrans',currentlocation)
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 2)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'tracknew.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'temp2':request.session['temp'] or '','prostatus':request.session['status'] or '','result':result3,'m': m,'ssccid':ssccid,'res_token':request.session['email'] or ''})

    elif resultstatus2['transaction_status']['transaction_status']=='DELIVERED':
        print('delivered',resultstatus2['transaction_status']['transaction_status'])
        entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        print(currentlocation)
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        # print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        return render(request,'tracknew.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'temp2':request.session['temp'] or '','prostatus':request.session['status'] or '','result':result3,'m': m,'ssccid':ssccid,'res_token':request.session['email'] or ''})

    elif resultstatus2['transaction_status']['transaction_status']=='RECEIVED':
        print('received',resultstatus2['transaction_status']['transaction_status'])
        entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        # print('received',currentlocation)
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        # print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        return render(request,'tracknew.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'temp2':request.session['temp'] or '','prostatus':request.session['status'] or '','result':result3,'m': m,'ssccid':ssccid,'res_token':request.session['email'] or ''})





# Mfg gtin+lot+serialno track
def distrackview(request,id,serialid):
    gnum = id
    serialid=serialid
    # import pdb; pdb.set_trace()
    result = requests.get(distrack_url.format(gnum,serialid)).json()
    result0=result.get("track")
    result1=result0.get("controll_conditions")
    result2=result1[0]
    result3=result2[0]
    resultstatus=result0.get("status")
    resultstatus2=resultstatus[0]
    resultgtin=result0.get("gtin_information")
    resultgtin1=resultgtin[0]
    resultlocation=result0.get("locations")
    resultentrylocation1=resultlocation[0][1]
    resultexitlocation2=resultlocation[0][2]
    resultcurrentlocation3=resultlocation[0][0]
    resultlot=result0.get("lot_information")
    resultlot1=resultlot[0]
    resultowner=result0.get("owner")
    resultentryowner=resultowner[0]
    resultcurrentowner=resultowner[1]
    resultexitowner=resultowner[2]
    resulttransaction=result0.get("transaction_event")
    resulttransaction2=resulttransaction[0]

    result3.update(resultentryowner)
    result3.update(resultexitowner)
    result3.update(resultcurrentowner)
    result3.update(resulttransaction2)
    result3.update(result0)
    result3.update(resultentrylocation1)
    result3.update(resultexitlocation2)
    result3.update(resultcurrentlocation3)
    result3.update(resultlot1)
    result3.update(resultstatus2)
    result3.update(resultgtin1)

    if resultstatus2['transaction_status']['transaction_status']=='PACKAGED':
        entrypoint =(float(resultentryowner['entry_point_owner']['latitude']), float(resultentryowner['entry_point_owner']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)

        # popup = folium.Popup(test, max_width=230,min_width=230)
        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'distrack.html',{'resultponotify':request.session['res'],'resultcartcount':request.session['rescount'],'result':result3,'m':m,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
    elif resultstatus2['transaction_status']['transaction_status']=='SHIPPED':
        entrypoint =(float(resultentryowner['entry_point_owner']['latitude']), float(resultentryowner['entry_point_owner']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)

        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'distrack.html',{'resultponotify':request.session['res'],'resultcartcount':request.session['rescount'],'result':result3,'m':m,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
    elif resultstatus2['transaction_status']['transaction_status']=='HAND OFF':
        entrypoint =(float(resultentryowner['entry_point_owner']['latitude']), float(resultentryowner['entry_point_owner']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)

        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'distrack.html',{'resultponotify':request.session['res'],'resultcartcount':request.session['rescount'],'result':result3,'m':m,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
    elif resultstatus2['transaction_status']['transaction_status']=='IN-TRANSIT':
        entrypoint =(float(resultentryowner['entry_point_owner']['latitude']), float(resultentryowner['entry_point_owner']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)

        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'distrack.html',{'resultponotify':request.session['res'],'resultcartcount':request.session['rescount'],'result':result3,'m':m,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
    elif resultstatus2['transaction_status']['transaction_status']=='DELIVERED':
        entrypoint =(float(resultentryowner['entry_point_owner']['latitude']), float(resultentryowner['entry_point_owner']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)

        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'distrack.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result3,'m':m,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
    elif resultstatus2['transaction_status']['transaction_status']=='RECEIVED':
        entrypoint =(float(resultentryowner['entry_point_owner']['latitude']), float(resultentryowner['entry_point_owner']['longitude']))
        exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
        currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
        fig = Figure(width=1350, height=370)
        m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
        fig.add_child(m)
        test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
        test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
        test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
        popup = folium.Popup(test, max_width=230,min_width=230)
        popup1 = folium.Popup(test1, max_width=230,min_width=230)
        popup2 = folium.Popup(test2, max_width=230,min_width=230)

        # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
        folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
        # folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
        #print([entry_point,current_location,exit_point])
        folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
        # folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
        m = m._repr_html_()
        # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
        return render(request,'distrack.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result3,'m':m,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
    else:
        return render(request,'error2.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})



# Mfg gtin+lot+serialno trace
def tracenewview(request,id,searchInput,serialid):
    gnum = id
    searchInput=searchInput
    serialid=serialid
    result = requests.get(tracenew_url.format(gnum,searchInput,serialid)).json()
    result0=result[0]
    result1=result0.get("trace")
    resultitem=result1[0]
    print(resultitem)
    resultlot=result1[1]
    # print(resultlot)
    resultproduct=result1[2]
    # print(resultproduct)
    resultowner=result1[3]
    resultownerinfo=resultowner.get("owner")
    resultcurrentowner=resultownerinfo[0]
    resultentry_point=resultownerinfo[1]
    resultexit_point=resultownerinfo[2]
    resultprevious_owner=resultownerinfo[3]
    resultall_previous_owner=resultownerinfo[4]
    resultlocation=result1[4]
    resultlocationinfo=resultlocation.get("location")
    resultloactioncurrentowner=resultlocationinfo[0]
    resultloactionentry_point=resultlocationinfo[1]
    resultloactionexit_point=resultlocationinfo[2]
    resultloactionall_previous_owners_location=resultlocationinfo[3]
    previousownerresult=resultloactionall_previous_owners_location.get("all_previous_owners_location")
    previousown=len(previousownerresult)
    previousowner = []
    for value in range(14):
        if previousown-1 >= value:
            previousowner.append(previousownerresult[value])
        else:
            previousowner.append({
            "gln": "",
            "owner_address": "",
            "owner_name": ""
            })
    previousowner0=previousowner[0]
    previousowner1=previousowner[1]
    previousowner2=previousowner[2]
    previousowner3=previousowner[3]
    previousowner4=previousowner[4]
    previousowner5=previousowner[5]
    previousowner6=previousowner[6]
    previousowner7=previousowner[7]
    previousowner8=previousowner[8]
    previousowner9=previousowner[9]
    previousowner10=previousowner[10]
    previousowner11=previousowner[11]
    previousowner12=previousowner[12]
    previousowner13=previousowner[13]
    # import pdb; pdb.set_trace()
    resultloactionlatest_transaction_location=resultlocationinfo[4]
    latesttransactionlocation=resultloactionlatest_transaction_location.get("latest_transaction_location")
    resulttransaction=result1[5]
    resulttransactioninfo=resulttransaction.get("transaction")
    resultcurrenttransactioninfo=resulttransactioninfo[0]
    resultprevioustransaction=resulttransactioninfo[1]
    resultprevioustransactioninforesult=resultprevioustransaction.get("previous_transactions")
    previoustrans=len(resultprevioustransactioninforesult)

    resultprevioustransactioninfo = []
    for value in range(14):
        if previoustrans-1 >= value:

            resultprevioustransactioninfo.append(resultprevioustransactioninforesult[value])
        else:
            # print(value)
            # print(previoustrans)
            resultprevioustransactioninfo.append({
            "event_type": "",
            "gln": "",
            "owner_name": "",
            "transaction_id": None,
            "transaction_timestamp": ""
            })
    resultprevioustransactioninfo0=resultprevioustransactioninfo[0]
    resultprevioustransactioninfo1=resultprevioustransactioninfo[1]
    # print(resultprevioustransactioninfo1)
    resultprevioustransactioninfo2=resultprevioustransactioninfo[2]
    # print(resultprevioustransactioninfo2)
    resultprevioustransactioninfo3=resultprevioustransactioninfo[3]
    # print(resultprevioustransactioninfo3)
    resultprevioustransactioninfo4=resultprevioustransactioninfo[4]
    resultprevioustransactioninfo5=resultprevioustransactioninfo[5]
    resultprevioustransactioninfo6=resultprevioustransactioninfo[6]
    resultprevioustransactioninfo7=resultprevioustransactioninfo[7]
    resultprevioustransactioninfo8=resultprevioustransactioninfo[8]
    resultprevioustransactioninfo9=resultprevioustransactioninfo[9]
    resultprevioustransactioninfo10=resultprevioustransactioninfo[10]
    resultprevioustransactioninfo11=resultprevioustransactioninfo[11]
    resultprevioustransactioninfo12=resultprevioustransactioninfo[12]
    resultprevioustransactioninfo13=resultprevioustransactioninfo[13]


    resultitem.update(resultlot)
    resultitem.update(resultproduct)
    resultitem.update(resultcurrentowner)
    resultitem.update(resultentry_point)
    resultitem.update(resultexit_point)
    resultitem.update(resultprevious_owner)
    resultitem.update(resultloactioncurrentowner)
    resultitem.update(resultloactionentry_point)
    resultitem.update(resultloactionexit_point)
    resultitem.update(latesttransactionlocation)
    resultitem.update(resultcurrenttransactioninfo)

    return render(request,'tracenew.html',{
    'result':resultitem,
    'previousownerlocation0':previousowner0,
    'previousownerlocation1':previousowner1,
    'previousownerlocation2':previousowner2,
    'previousownerlocation3':previousowner3,
    'previousownerlocation4':previousowner4,
    'previousownerlocation5':previousowner5,
    'previousownerlocation6':previousowner6,
    'previousownerlocation7':previousowner7,
    'previousownerlocation8':previousowner8,
    'previousownerlocation9':previousowner9,
    'previousownerlocation10':previousowner10,
    'previousownerlocation11':previousowner11,
    'previousownerlocation12':previousowner12,
    'previousownerlocation13':previousowner13,
    'locationcurrentowner':resultloactioncurrentowner,
    'locationentrypoint':resultloactionentry_point,
    'locationexitpoint':resultloactionexit_point,
    'resultprevioustransactioninfo0':resultprevioustransactioninfo0,
    'resultprevioustransactioninfo1':resultprevioustransactioninfo1,
    'resultprevioustransactioninfo2':resultprevioustransactioninfo2,
    'resultprevioustransactioninfo3':resultprevioustransactioninfo3,
    'resultprevioustransactioninfo4':resultprevioustransactioninfo4,
    'resultprevioustransactioninfo5':resultprevioustransactioninfo5,
    'resultprevioustransactioninfo6':resultprevioustransactioninfo6,
    'resultprevioustransactioninfo7':resultprevioustransactioninfo7,
    'resultprevioustransactioninfo8':resultprevioustransactioninfo8,
    'resultprevioustransactioninfo9':resultprevioustransactioninfo9,
    'resultprevioustransactioninfo10':resultprevioustransactioninfo10,
    'resultprevioustransactioninfo11':resultprevioustransactioninfo11,
    'resultprevioustransactioninfo12':resultprevioustransactioninfo12,
    'resultprevioustransactioninfo13':resultprevioustransactioninfo13,
    'resultponotify':request.session['res'],'resultcartcount':request.session['rescount'],'res_token':request.session['email'] or ''})

def po_infoview(request):
    try:
        # import pdb; pdb.set_trace()
        pono = request.POST.get('po_info')
        resultpo = requests.get(tracktrace_poinfourl.format(pono)).json()
        result0=resultpo.get("track")
        result1=result0.get("controll_conditions")
        result2=result1[0]
        result3=result2[0]
        resultstatus=result0.get("status")
        resultstatus2=resultstatus[0]
        resultpackage=result0.get("package_information")
        resultpackage1=resultpackage[0]
        resultlocation=result0.get("locations")
        resultentrylocation1=resultlocation[0][1]
        # print(resultentrylocation1)
        resultexitlocation2=resultlocation[0][2]
        # print(resultexitlocation2)
        resultcurrentlocation3=resultlocation[0][0]

        resultowner=result0.get("owner")
        resultentryowner=resultowner[0]
        resultcurrentowner=resultowner[1]

        resultexitowner=resultowner[2]

        resultpackage=result0.get("package_information")
        resultpackageinfo=resultpackage[0]
        resultpackageinfodetails=resultpackageinfo.get("package_information")
        resultgtin=result0.get("gtin_information")
        resultgtininfo=resultgtin[0]
        resultgtininfodetails=resultgtininfo.get("gtin_information")
        resulttransaction=result0.get("transaction_event")
        resulttransaction2=resulttransaction[0]



        result3.update(resultentryowner)
        result3.update(resultexitowner)
        result3.update(resultcurrentowner)
        result3.update(resulttransaction2)
        # result3.update(result0)
        # result3.update(result2)
        result3.update(resultentrylocation1)
        result3.update(resultexitlocation2)
        result3.update(resultcurrentlocation3)
        # result3.update(resultlot1)
        result3.update(resultstatus2)
        result3.update(resultpackage1)
        result3.update(resultpackageinfodetails)
        result3.update(resultgtininfodetails)
        #result3.update(resultevidence)
    except:
        return render(request,'error.html')
    else:
        return render(request, 'po_info.html', {'pono':pono,'result': result3, 'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def po_trackview(request,po):
    try:
        # import pdb; pdb.set_trace()
        # pono = request.POST.get('po_info')
        pono=po
        resultpo = requests.get(tracktrace_poinfourl.format(pono)).json()
        result0=resultpo.get("track")
        result1=result0.get("controll_conditions")
        result2=result1[0]
        result3=result2[0]
        resultstatus=result0.get("status")
        resultstatus2=resultstatus[0]
        resultpackage=result0.get("package_information")
        resultpackage1=resultpackage[0]
        resultlocation=result0.get("locations")
        resultentrylocation1=resultlocation[0][1]
        # print(resultentrylocation1)
        resultexitlocation2=resultlocation[0][2]
        # print(resultexitlocation2)
        resultcurrentlocation3=resultlocation[0][0]

        resultowner=result0.get("owner")
        resultentryowner=resultowner[0]
        resultcurrentowner=resultowner[1]

        resultexitowner=resultowner[2]

        resultpackage=result0.get("package_information")
        resultpackageinfo=resultpackage[0]
        resultpackageinfodetails=resultpackageinfo.get("package_information")
        resultgtin=result0.get("gtin_information")
        resultgtininfo=resultgtin[0]
        resultgtininfodetails=resultgtininfo.get("gtin_information")
        resulttransaction=result0.get("transaction_event")
        resulttransaction2=resulttransaction[0]



        result3.update(resultentryowner)
        result3.update(resultexitowner)
        result3.update(resultcurrentowner)
        result3.update(resulttransaction2)
        # result3.update(result0)
        # result3.update(result2)
        result3.update(resultentrylocation1)
        result3.update(resultexitlocation2)
        result3.update(resultcurrentlocation3)
        # result3.update(resultlot1)
        result3.update(resultstatus2)
        result3.update(resultpackage1)
        result3.update(resultpackageinfodetails)
        result3.update(resultgtininfodetails)
        #result3.update(resultevidence)

        if resultstatus2['transaction_status']['transaction_status']=='PACKAGED':
            # print('packing',resultstatus2['transaction_status']['transaction_status'])
            entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
            exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
            currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
            # print('received',currentlocation)
            fig = Figure(width=1350, height=370)
            m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
            fig.add_child(m)
            test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
            test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
            test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
            popup = folium.Popup(test, max_width=230,min_width=230)
            popup1 = folium.Popup(test1, max_width=230,min_width=230)
            popup2 = folium.Popup(test2, max_width=230,min_width=230)
            # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            # folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
            folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
            # print([entry_point,current_location,exit_point])
            folium.PolyLine(locations = [entrypoint,exitpoint], color="red",line_opacity = 0.5).add_to(m)
            # folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
            m = m._repr_html_()
            return render(request, 'po_track.html', {'pono':pono,'result': result3,'m': m,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

        elif resultstatus2['transaction_status']['transaction_status'] == 'SHIPPED':
            print('shiping',resultstatus2['transaction_status']['transaction_status'])
            entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
            exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
            currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
            print(currentlocation)
            fig = Figure(width=1350, height=370)
            m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
            fig.add_child(m)
            test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
            test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
            test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
            popup = folium.Popup(test, max_width=230,min_width=230)
            popup1 = folium.Popup(test1, max_width=230,min_width=230)
            popup2 = folium.Popup(test2, max_width=230,min_width=230)
            # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
            folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
            # print([entry_point,current_location,exit_point])
            folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
            folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
            m = m._repr_html_()
            return render(request, 'po_track.html', {'pono':pono,'result': result3,'m': m,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

        elif resultstatus2['transaction_status']['transaction_status']=='HAND OFF':
            print('handoff',resultstatus2['transaction_status']['transaction_status'])
            entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
            exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
            currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
            print('handof',currentlocation)
            fig = Figure(width=1350, height=370)
            m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 2)
            fig.add_child(m)
            test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
            test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
            test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
            popup = folium.Popup(test, max_width=230,min_width=230)
            popup1 = folium.Popup(test1, max_width=230,min_width=230)
            popup2 = folium.Popup(test2, max_width=230,min_width=230)
            # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
            folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
            #print([entry_point,current_location,exit_point])
            folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
            folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
            m = m._repr_html_()
            # return render(request,'distrack.html',{'result':result3,'serialid':serialid,'gnum':gnum,'res_token':request.session['email'] or ''})
            return render(request, 'po_track.html', {'pono':pono,'result': result3,'m': m,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


        elif resultstatus2['transaction_status']['transaction_status']=='IN-TRANSIT':
            print('intransit',resultstatus2['transaction_status']['transaction_status'])
            entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
            exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
            currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
            print('intrans',currentlocation)
            fig = Figure(width=1350, height=280)
            m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 2)
            fig.add_child(m)
            test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
            test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
            test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
            popup = folium.Popup(test, max_width=230,min_width=230)
            popup1 = folium.Popup(test1, max_width=230,min_width=230)
            popup2 = folium.Popup(test2, max_width=230,min_width=230)
            folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
            folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
            folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
            folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
            m = m._repr_html_()
            return render(request, 'po_track.html', {'pono':pono,'result': result3,'m': m,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

        elif resultstatus2['transaction_status']['transaction_status']=='DELIVERED':
            print('delivered',resultstatus2['transaction_status']['transaction_status'])
            entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
            exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
            currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
            print(currentlocation)
            fig = Figure(width=1350, height=370)
            m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
            fig.add_child(m)
            test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
            test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
            test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
            popup = folium.Popup(test, max_width=230,min_width=230)
            popup1 = folium.Popup(test1, max_width=230,min_width=230)
            popup2 = folium.Popup(test2, max_width=230,min_width=230)
            # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
            folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
            # print([entry_point,current_location,exit_point])
            folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
            folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
            m = m._repr_html_()
            return render(request, 'po_track.html', {'pono':pono,'result': result3,'m': m,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

        elif resultstatus2['transaction_status']['transaction_status']=='RECEIVED':
            print('received',resultstatus2['transaction_status']['transaction_status'])
            entrypoint =(float(resultentrylocation1['entry_point_location']['latitude']), float(resultentrylocation1['entry_point_location']['longitude']))
            exitpoint = (float(resultexitlocation2['exit_point_location']['latitude']), float(resultexitlocation2['exit_point_location']['longitude']))
            currentlocation = (float(resultcurrentlocation3['current_location']['current_lat']),float(resultcurrentlocation3['current_location']['current_long']) )
            # print('received',currentlocation)
            fig = Figure(width=1350, height=370)
            m = folium.Map(location = currentlocation,tiles='openstreetmap',zoom_start = 3)
            fig.add_child(m)
            test = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b><br><i>Latitude: </i><b>{}</b><br><i>Longitude: </i><b>{}</b>""".format(resultcurrentlocation3['current_location']['current_address'],resultcurrentowner['current_owner']['current_owner'],resultcurrentlocation3['current_location']['current_lat'],resultcurrentlocation3['current_location']['current_long']), script=True)
            test1 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}""".format(resultentryowner['entry_point_owner']['address'],resultentryowner['entry_point_owner']['owner']), script=True)
            test2 = folium.Html("""<i> Owner Address:<b>{}</b> </i><br><i>Owner Name: </i><b>{}</b>""".format(resultexitowner['exit_point_ower']['company_address'],resultexitowner['exit_point_ower']['comapny_name']), script=True)
            popup = folium.Popup(test, max_width=230,min_width=230)
            popup1 = folium.Popup(test1, max_width=230,min_width=230)
            popup2 = folium.Popup(test2, max_width=230,min_width=230)
            # folium.Marker(current_location,popup="""<i> Owner location: </i><i> Product Name: </i><i>Owner Name: </i><b><br>{}</b><br>""".format(result['owner_info']['current_owner']), tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(currentlocation,popup= popup, tooltip = 'Current Location',icon=folium.Icon(color='black')).add_to(m)
            folium.Marker(entrypoint,popup= popup1,tooltip = 'Entry Point', icon=folium.Icon(color='red',icon='ship', prefix='fa')).add_to(m)
            folium.Marker(exitpoint,popup= popup2,tooltip = 'Exit Point',icon=folium.Icon(color='green',icon='home', prefix='fa')).add_to(m)
            # print([entry_point,current_location,exit_point])
            folium.PolyLine(locations = [entrypoint,currentlocation], color="red",line_opacity = 0.5).add_to(m)
            folium.PolyLine(locations = [currentlocation,exitpoint], color="red",dash_array='10',line_opacity = 0.5).add_to(m)
            m = m._repr_html_()
            return render(request, 'po_track.html', {'pono':pono,'result': result3,'m': m,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})
    except:
        return render(request,'error.html')
    else:
        return render(request, 'po_track.html', {'pono':pono,'result': result3, 'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})



def popupview(request):
    pass
    return render(request,'popup.html')

def product_listview(request):
    # import pdb; pdb.set_trace()
    product_list=requests.get(product_list_url).json()
    p = Paginator(product_list, 4)  # creating a paginator object
    # getting the desired page number from url
    page_number = request.GET.get('page')
    try:
        page_obj = p.get_page(page_number)  # returns the desired page object
    except PageNotAnInteger:
        # if page_number is not an integer then assign the first page
        page_obj = p.page(1)
    except EmptyPage:
        # if page is empty then return last page
        page_obj = p.page(p.num_pages)
    return render(request,'product_list.html',{'resultcartcount':request.session['rescount'],'result':page_obj,'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def search_product(request):
    try:
        # import pdb; pdb.set_trace()
        productname = request.POST.get('search_product')
        result1 = requests.get(search_product_infourl.format(productname)).json()
        result = result1.get("Supplier_Product_Details")
    except:
        return render(request,'error.html')
    else:
        return render(request, 'product_details.html', {'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result': result,'res_token': request.session['email'] or ''})
    # return render(request, 'searchlevel.html', {'result': result,'ssccresult':ssccresult,'lotresultcount':lotresultcount, 'gnum': gnum, 'lotresult': lotresult1, 'res_token': request.session['email'] or ''})


def productdata(request,gtin):
    # pass
    gtin=gtin
    product_details=requests.get(product_details_url.format(gtin)).json()
    result=product_details.get("Supplier_Product_Details")
    return render(request,'product_details.html',{'resultcartcount':request.session['rescount'],'result':result,'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})



def product_cart(request,supplier_id,id,gtin):
    # import pdb; pdb.set_trace()
    id=id
    supplier_id=supplier_id
    gtin=gtin
    quantity="1"

    # data={'id':id,'product_id':product_id}
    data={'quantity':quantity,'selected_product_pricing':'http://3.239.56.34:8003/api/v1.0.0/product_pricing/'+str(supplier_id)+'/','user':'http://3.239.56.34:8003/api/v1.0.0/myappusers/'+str(id)+'/'}
    result=requests.post(product_cart_url,data).json()
    product_details=requests.get(product_details_url.format(gtin)).json()
    result=product_details.get("Supplier_Product_Details")
    messages.info(request,'Item added to cart Successfully')
    res_token=request.session['email']
    users=res_token[0]
    userid=users.get("id")
    result3 = requests.get(product_cart_item_count_url.format(userid)).json()
    resultcartcount=result3.get("cart_count")
    request.session['rescount'] = resultcartcount,

    return render(request,'product_details.html',{'resultcartcount':request.session['rescount'],'result':result,'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def delete_item(request):
    pass
    return render(request,'cart.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def delete_cartitem(request,cartid,uid):
    # import pdb; pdb.set_trace()
    cartid=cartid
    uid=uid
    requests.delete('http://3.239.56.34:8003/api/v1.0.0/addToCART/'+str(cartid)+'/')
    cart_data=requests.get(cart_data_url.format(uid)).json()
    result=cart_data.get("cart_count")
    price=requests.get(total_trice_url.format(uid)).json()
    totalprice=price.get("total_price")
    # for item in result:
    #     quantity=item.get("quantity")
    #     quan=int(quantity)
    #     product_price=item.get("product_price")
    #     price=int(product_price)
    #     resultamount=(quan*price)
    address_list=requests.get(address_list_url.format(uid)).json()
    result_address=address_list.get("select_address")
    res_token=request.session['email']
    users=res_token[0]
    userid=users.get("id")
    result3 = requests.get(product_cart_item_count_url.format(userid)).json()
    resultcartcount=result3.get("cart_count")
    request.session['rescount'] = resultcartcount,

    return render(request,'cart.html',{'totalprice':totalprice,'result_address':result_address,'result':result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def product_details(request,id):
    # import pdb; pdb.set_trace()
    # id=id
    pass
    return render(request,'product_details.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def cartview(request):
    pass
    return render(request,'cart.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def cart_checkout(request,id,uid):
    # import pdb; pdb.set_trace()
    id=id
    uid=uid
    quantity=request.POST.get('quantity')
    data2={'quantity':quantity}
    result2=requests.put('http://3.239.56.34:8003/api/v1.0.0/addToCART/'+str(id)+'/',data2)
    # print(result2)
    # proceed_cart_details=requests.get(proceed_cart_url.format(uid)).json()
    cart_data=requests.get(cart_data_url.format(uid)).json()
    result=cart_data.get("cart_count")
    price=requests.get(total_trice_url.format(uid)).json()
    totalprice=price.get("total_price")
    # for item in result:
    #     quantity=item.get("quantity")
    #     quan=int(quantity)
    #     product_price=item.get("product_price")
    #     price=int(product_price)
    #     resultamount=(quan*price)
    address_list=requests.get(address_list_url.format(uid)).json()
    result_address=address_list.get("select_address")
    return render(request,'cart.html',{'totalprice':totalprice,'result_address':result_address,'result':result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def cart_address(request,id,uid):
    id=id
    uid=uid
    delivery_address_id=request.POST.get('addressid')
    delivery=request.POST.get('address')
    userid=request.POST.get('user')
    quantity=request.POST.get('quantity')
    amount=request.POST.get('price')
    order_status=request.POST.get('order_status')
    data1={'delivery':'http://3.239.56.34:8003/company_address/'+str(delivery_address_id)+'/','order_status':order_status,'amount':amount,'user':'http://3.239.56.34:8003/api/v1.0.0/myappusers/'+str(userid)+'/'}
    result1=requests.post(cart_address_url,data1).json()
    proceed_cart_details=requests.get(proceed_cart_url.format(uid)).json()
    result_proceed=proceed_cart_details.get("order_confrim")

    return render(request,'proceed_cart.html',{'result':result_proceed,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def cartdataview(request,id):
    # import pdb; pdb.set_trace()
    id=id
    cart_data=requests.get(cart_data_url.format(id)).json()
    result=cart_data.get("cart_count")
    price=requests.get(total_trice_url.format(id)).json()
    totalprice=price.get("total_price")
    address_list=requests.get(address_list_url.format(id)).json()
    result_address=address_list.get("select_address")
    return render(request,'cart.html',{'totalprice':totalprice,'result':result,'result_address':result_address,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def order_conformed(request,q,si,oi,uid):
    # import pdb; pdb.set_trace()
    uid=uid
    quantity=q
    suppliers_product_id=si
    order_id=oi
    proceed_cart_details=requests.get(proceed_cart_url.format(uid)).json()
    result_proceed=proceed_cart_details.get("order_confrim")
    for item in result_proceed:
        sale_item_status="Order Placed"
        quantity=item.get("quantity")
        suppliers_product_id=item.get("suppliers_product_id")
        order_id=item.get("order_id")
        product_price=item.get("product_price")
        data1={'sale_item_status':sale_item_status,'quantity':quantity,'amount':product_price,'supplier_product':'http://3.239.56.34:8003/api/v1.0.0/product_suppliers/'+str(suppliers_product_id)+'/','sale_order':'http://3.239.56.34:8003/api/v1.0.0/orders/'+str(order_id)+'/'}
        result1=requests.post(cart_confirm_url,data1).json()

    product_list=requests.get(product_list_url).json()
    p = Paginator(product_list, 4)
    page_number = request.GET.get('page')
    try:
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    messages.info(request,'Placed Order Successfully')
    requests.delete('http://3.86.246.56:5000/api/micro/v1/product/cartDelete/'+str(uid))
    result3 = requests.get(product_cart_item_count_url.format(uid)).json()
    resultcartcount=result3.get("cart_count")
    request.session['rescount'] = resultcartcount,
    return render(request,'product_list.html',{'result':page_obj,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def order_listview(request):
    # import pdb; pdb.set_trace()
    users=request.session['email']
    userid=users[0]
    user_id=userid.get("id")
    # user_id=user_id
    order_list=requests.get(order_list_url.format(user_id)).json()
    order_result=order_list.get("order_list")
    p = Paginator(order_result, 5)
    page_number = request.GET.get('page')
    try:
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    return render(request,'order_list.html',{'result':page_obj,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def dist_order_detailsview(request,po):
    # import pdb; pdb.set_trace()
    order_details=requests.get(dist_order_details_url.format(po)).json()
    result=order_details.get("order_list")
    return render(request,'dist_order_details.html',{'result':result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def mfg_orderview(request):
    # import pdb; pdb.set_trace()
    users=request.session['email']
    userid=users[0]
    id=userid.get("id")
    order_list=requests.get(mfg_order_list_url.format(id)).json()
    order_result=order_list.get("select")
    p = Paginator(order_result, 4)
    page_number = request.GET.get('page')
    try:
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    return render(request,'mfg_orders.html',{'result':page_obj,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def mfg_order_detailsview(request):
    pass
    return render(request,'mfg_order_details.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def mfg_productview(request,id):
    productid=id
    order_list=requests.get(mfg_orderdetails_url.format(productid)).json()
    order_result=order_list.get("select")

    return render(request,'mfg_order_details.html',{'result':order_result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def cancel_orderview(request,id,uid):
    # import pdb; pdb.set_trace()
    user_id=uid
    orderno=id
    order_status='Order Cancelled'
    data2={'order_status':order_status}
    resultstatus=requests.put('http://3.239.56.34:8003/api/v1.0.0/orders/'+str(orderno)+'/',data2)
    order_list=requests.get(order_list_url.format(user_id)).json()
    order_result=order_list.get("order_list")
    p = Paginator(order_result, 4)
    page_number = request.GET.get('page')
    try:
        page_obj = p.get_page(page_number)
    except PageNotAnInteger:
        page_obj = p.page(1)
    except EmptyPage:
        page_obj = p.page(p.num_pages)
    return render(request,'order_list.html',{'result':page_obj,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def asn_statusview(request,id,pid):
    # import pdb; pdb.set_trace()
    id=id
    # userid=uid
    order_status='Accepted'
    data2={'sale_item_status':order_status}
    resultstatus=requests.put('http://3.239.56.34:8003/api/v1.0.0/saleOrders/'+str(id)+'/',data2)
    # resultstatus=requests.put('http://3.239.56.34:8003/api/v1.0.0/orders/'+str(orderno)+'/',data2)
    productid=pid
    order_list=requests.get(mfg_orderdetails_url.format(productid)).json()
    order_result=order_list.get("select")
    # users=request.session['email']
    # userid=users[0]
    # id=userid.get("id")
    # order_list=requests.get(mfg_order_list_url.format(id)).json()
    # order_result=order_list.get("select")
    return render(request,'mfg_order_details.html',{'result':order_result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def reject_statusview(request,id,pid):
    # import pdb; pdb.set_trace()
    id=id
    order_status='Rejected'
    data2={'sale_item_status':order_status}
    resultstatus=requests.put('http://3.239.56.34:8003/api/v1.0.0/saleOrders/'+str(id)+'/',data2)
    # resultstatus=requests.put('http://3.239.56.34:8003/api/v1.0.0/orders/'+str(orderno)+'/',data2)
    productid=pid
    order_list=requests.get(mfg_orderdetails_url.format(productid)).json()
    order_result=order_list.get("select")
    # users=request.session['email']
    # userid=users[0]
    # id=userid.get("id")
    # order_list=requests.get(mfg_order_list_url.format(id)).json()
    # order_result=order_list.get("select")
    return render(request,'mfg_orders.html',{'result':order_result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def acceptedlistview(request):
    users=request.session['email']
    userid=users[0]
    id=userid.get("id")
    order_list=requests.get(mfg_rejectedlist_url.format(id)).json()
    order_result=order_list.get("select")
    return render(request,'acceptedlist.html',{'result':order_result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def rejectedlistview(request):
    users=request.session['email']
    userid=users[0]
    id=userid.get("id")
    order_list=requests.get(mfg_rejectedlist_url.format(id)).json()
    order_result=order_list.get("select")
    return render(request,'rejectedlist.html',{'result':order_result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def consign_detailsview(request,oid):
    # import pdb; pdb.set_trace()
    orderid=oid
    data=requests.get(asaign_consignment_url.format(orderid)).json()
    result=data.get("order_list")
    data1=requests.get('http://3.86.246.56:5000/api/micro/v1/product/LogisticsList').json()
    result1=data1.get("logistics_list")
    data2=requests.get('http://3.86.246.56:5000/api/micro/v1/product/palletList').json()
    result2=data2.get("pallet_list")
    # print(result1)
    return render(request,'consign_details.html',{'resultpallet':result2,'result':result,'resultlsp':result1,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

# def conform_consignview(request,oid):
    # import pdb; pdb.set_trace()
    # oid=oid
    # ssccno=request.POST.get("ssccno")
    # grai=request.POST.get('grai')
    # giai=request.POST.get('giai')
    # container_dimensions=request.POST.get('container_dimensions')
    # package_dimensions=request.POST.get('package_dimensions')
    # package_netweight=request.POST.get('package_netweight')
    # package_grossweight=request.POST.get('package_grossweight')
    # purchase_order_no=request.POST.get('purchase_order_no')
    # purchase_orderdate=request.POST.get('purchase_orderdate')
    # quantity=request.POST.get('quantity')
    # sale_order=request.POST.get('sale_order')
    # package_type=request.POST.get('package_type')
    # lsp_provider=request.POST.get('lsp_provider')
    # package_inside_sellableunits=request.POST.get('package_inside_sellableunits')
    # package_inside_units=request.POST.get('package_inside_units')
    # invoice=request.POST.get('invoice')
    # from_owner=request.POST.get('from_owner')
    # to_owner=request.POST.get('to_owner')
    # palletid=request.POST.get('palletid')
    # from_address=request.POST.get('from_address')
    # to_address=request.POST.get('to_address')
    # lsp_address=request.POST.get('lsp_address')
    # lot_id=request.POST.get('lot_id')
    # recall=request.POST.get('recall')
    # owner=request.POST.get('owner')
    # packaging_time=request.POST.get('owner')
    #
    #
    # data={'sscc_no':ssccno,'grai':grai,'giai':giai,'lsp_provider_0':lsp_provider,
    # 'container_dimensions':container_dimensions,'package_dimentions':package_dimensions,
    # 'package_net_weight':package_netweight,'package_gross_weight':package_grossweight,
    # 'purchase_order':purchase_order_no,'ordered_date':purchase_orderdate,
    # 'order_qty':quantity,'sale_order':sale_order,'package_type':package_type,
    # 'package_inside_salable_units':package_inside_sellableunits,'owner':owner,'packaging_time':packaging_time,
    # 'package_inside_units':package_inside_units,'invoice_no':invoice,'lot_id':lot_id,'recall':recall,
    # "pallet": 'http://3.239.56.34:8003/tp_package_pallet/'+str(4)+'/',
    # "from_owner": "http://3.239.56.34:8003/company/"+str(from_owner)+'/',
    # "to_owner": "http://3.239.56.34:8003/company/"+str(to_owner)+'/',
    # "lsp_provider": "http://3.239.56.34:8003/company/"+str(31)+'/',
    # "from_address": "http://3.239.56.34:8003/company_address/"+str(from_address)+'/',
    # "to_address": "http://3.239.56.34:8003/company_address/"+str(to_address)+'/',
    # "lsp_address": "http://3.239.56.34:8003/company_address/"+str(3)+'/',
    # }
    # result1=requests.post('http://3.239.56.34:8003/tp_product_dispatch_mfg_to_disb/',data).json()
    # return render(request,'mfg_orders.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def conform_consignview(request):
    pass
    messages.info(request,'Consignment Done proceed to Track and Trace')
    return render(request,'dashboard_new.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def status_updateview(request):
    pass
    return render(request,'cart.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})



def consignmentview(request):
    # import pdb; pdb.set_trace()
    users=request.session['email']
    userid=users[0]
    id=userid.get("id")
    con_list=requests.get(consignment_list_url.format(id)).json()
    con_result=con_list.get("order_list")
    return render(request,'consignment.html',{'result':con_result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})



def order_detailsview(request):
    pass
    return render(request,'order_details.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def proceed_cart(request):
    pass
    return render(request,'proceed_cart.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def checkoutview(request):
    pass
    return render(request,'checkout.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def transactionformview(request):
    pass
    return render(request,'transactionform.html')


# Manage User Profile view


def operatordashboard(request):
    pass
    return render(request,'operatordashboard.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

# Accounts view
def accountsview(request):
    pass
    return render(request,'accounts.html')

# Roles view
def rolesview(request):
    pass
    return render(request,'roles.html')

def testview(request):
    pass
    return render(request,'test.html')



def TrackTraceview(request):
    result = requests.get().json(TrackTrace_url)
    return render(request,'Track&Trace.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'], 'result':result, 'res_token':request.session['email'] or ''})


# trace and trace search for new template screens
def tracktrace(request):
    try:
        # import pdb; pdb.set_trace()
        result = requests.get(tracktrace_gtinlisturl).json()
        result2=result.get("gtin_list")
        result3 = requests.get(tracktrace_gtincounturl).json()
        ssccresult1=requests.get(tracktrace_sscclisturl).json()
        sscc=ssccresult1[0]
        sscclist=sscc.get("sscc_list")
        poresult1 = requests.get(tracktrace_polisturl).json()
        po = poresult1[0]
        polist = po.get("po_list")
    except:
        return render(request,'error.html')
    else:
        return render(request,'tracktrace.html',{'polist':polist,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result2':result2,'sscclist':sscclist,'result3':result3, 'res_token':request.session['email'] or ''})


def retailtraceview(request):
    result = requests.get(retailertrace_url).json()
    return render(request,'retailtrace.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result, 'res_token':request.session['email'] or ''})

def distribtraceview(request):
    result = requests.get(distribtrace_url).json()
    return render(request,'distribtrace.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result, 'res_token':request.session['email'] or ''})

def mainbaseview(request):
    pass
    return render(request,'mainbase.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'], 'res_token':request.session['email'] or '','temp2':request.session['temp'] or ''})


# Permissions view
def permissionsview(request):
    pass
    return render(request,'permissions.html')

# Licence view
def licenceview(request):
    pass
    return render(request,'licence.html')


# Manufacturer details getting from manufacturer api view
def manufacturer_order_details_view(request):
    # import  pdb;pdb.set_trace()
    result_old=requests.get(manufacturer_order_details_url).json()
    result=[]
    for row in result_old:
        if row['product_disp']['order_status']=='In Transit':
            result.append(row)

    return render(request,'manufacturer_order_details.html',{'resultcartcount':request.session['rescount'],'result':result,'res_token':request.session['email'] or ''})

 # Manufacturer details Showing api view
def manufacturer_order_details_edit_view(request,id):
    import pdb; pdb.set_trace()
    result=requests.get().json(manufacturer_order_details_edit_url)
    return render(request,'manufacturer_order_details_edit.html',{'result':result,'res_token':request.session['email'] or ''})


# for base page view
def base_view(request):
    result=requests.get(base_view_url).json()
    return render(request,'base.html',{ 'result':result, 'username':request.session['username'] or ''})

# for registration form 1 drop down bounding




#mobile app aplication view
def homeview(request):
    try:
        # import pdb; pdb.set_trace()
        result = requests.get(homeview_url).json()
        return render(request, 'home.html', {'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result': result, 'username':request.session['username'] or ''})
    except:
        return render(request,'home.html')



#  mobile app application showing result view
def detailsview(request):
    result = requests.get(detailsview_url).json()
    final_resut = []
    for res in result:
        if request.GET.get('details') in res['em_serial_no']:
            final_resut.append(res)
        if request.GET.get('details') in res['em_ndc']:
            final_resut.append(res)


    return render(request, 'details.html', {'result': final_resut})

#manufacturer search view
def searchlevel(request):
    try:
        # import pdb; pdb.set_trace()
        gnum = request.POST.get('searchlevel')
        result1 = requests.get(searchlevel_gtininfourl.format(gnum)).json()
        result = result1.get("gtin_information")
        lotresult1 = requests.get(searchlevel_lotlisturl.format(gnum)).json()
        lotlist=lotresult1.get("list_of_lot")
        lotcount = requests.get(searchlevel_lotcounturl.format(gnum)).json()
        ssccresult1=requests.get(searchlevel_sscclisturl).json()
        sscc=ssccresult1[0]
        ssccresult=sscc.get("sscc_list")
    except:
        return render(request,'error.html')
    else:
        return render(request, 'searchlevel.html', {'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result': result,'lotcount':lotcount,'ssccresult':ssccresult,'lotresult':lotlist, 'gnum': gnum, 'res_token': request.session['email'] or ''})
    # return render(request, 'searchlevel.html', {'result': result,'ssccresult':ssccresult,'lotresultcount':lotresultcount, 'gnum': gnum, 'lotresult': lotresult1, 'res_token': request.session['email'] or ''})

def sscc_info(request):
    try:
        # import pdb; pdb.set_trace()
        ssccno = request.POST.get('sscc_info')
        request.session['ssccinput'] = ssccno,
        ssccnosession=request.session['ssccinput']
        resultsscc_casecount = requests.get(sscc_case_count_url.format(ssccno)).json()
        resultsscc_caselist1 = requests.get(sscc_case_list_url.format(ssccno)).json()
        resultsscc_caselist=resultsscc_caselist1.get("case_list")
        # print(resultsscc_caselist)
        resultsscc = requests.get(tracktrace_ssccinfourl.format(ssccno)).json()
        # resultsscc = requests.get(tracktrace_ssccinfourl.format(ssccnosession)).json()
        resultssccevidence = requests.get(tracktrace_ssccinfoevidenceurl.format(ssccno)).json()
        resultevidence=resultssccevidence.get("evidences")
        # print(resultevidence)
        result0=resultsscc.get("track")
        result1=result0.get("controll_conditions")
        result2=result1[0]
        result3=result2[0]
        resultstatus=result0.get("status")
        resultstatus2=resultstatus[0]
        resultpackage=result0.get("package_information")
        resultpackage1=resultpackage[0]
        resultlocation=result0.get("locations")
        resultentrylocation1=resultlocation[0][1]
        # print(resultentrylocation1)
        resultexitlocation2=resultlocation[0][2]
        # print(resultexitlocation2)
        resultcurrentlocation3=resultlocation[0][0]

        resultowner=result0.get("owner")
        resultentryowner=resultowner[0]
        resultcurrentowner=resultowner[1]

        resultexitowner=resultowner[2]

        resultpackage=result0.get("package_information")
        resultpackageinfo=resultpackage[0]
        resultpackageinfodetails=resultpackageinfo.get("package_information")
        resultgtin=result0.get("gtin_information")
        resultgtininfo=resultgtin[0]
        resultgtininfodetails=resultgtininfo.get("gtin_information")
        resulttransaction=result0.get("transaction_event")
        resulttransaction2=resulttransaction[0]

        result3.update(resultentryowner)
        result3.update(resultexitowner)
        result3.update(resultcurrentowner)
        result3.update(resulttransaction2)
        result3.update(result0)
        result3.update(resultentrylocation1)
        result3.update(resultexitlocation2)
        result3.update(resultcurrentlocation3)
        # result3.update(resultlot1)
        result3.update(resultstatus2)
        result3.update(resultpackage1)
        result3.update(resultpackageinfodetails)
        result3.update(resultgtininfodetails)
        result3.update(resultevidence)
    except:
        return render(request,'error.html')
    else:
        return render(request, 'sscc_info.html', {'resultcartcount':request.session['rescount'],'caselist':resultsscc_caselist,'casecount':resultsscc_casecount,'resultponotify':request.session['res'],'ssccno':ssccno,'result': result3, 'res_token': request.session['email'] or ''})


def product_publish(request):
    pass
    return render(request,'product_publish.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token': request.session['email'] or ''})


def verifyview(request):
    pass
    return render(request,'verify.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def qrcodes(request):
    try:
        ssccno = request.POST.get('sscc_info')
        resultsscc = requests.get(tracktrace_ssccinfourl.format(ssccno)).json()
        resultsscc1= resultsscc[0]
        resultssccinfo=resultsscc1.get("sscc_list")
    except:
        return render(request,'error.html')
    else:
        return render(request, 'qrcodes.html', {'ssccno':ssccno,'result': resultssccinfo, 'res_token': request.session['email'] or ''})


def productmasterdataview(request):
    # import pdb; pdb.set_trace()
    try:
        if request.method=="POST":
            # import pdb; pdb.set_trace()
            product_name=request.POST.get('product_name')
            product_discription=request.POST.get('product_discription')
            brand_name=request.POST.get('brand_name')
            gtin=request.POST.get('gtin')
            # import pdb; pdb.set_trace()
            product_form=request.POST.get('product_form')

            # data2={'organization_category':organization_category}
            # result_category=requests.post(add_userview_data2_url,data2).json()
            data={'user_name':user_name,'email':email,'role':role,'alternate_email':alternate_email,'password':password,'first_name':first_name,'last_name':last_name,'contact_number':contact_number,'organization':'http://api.tracepharm.io:8000/organization_category/'+str(organization_id)+'/','add_user':'http://3.239.56.34:8000/update_user/'+str(user_id)+'/'}
            # data={'user_name':user_name,'email':email,'role':role,'alternate_email':alternate_email,'password':password,'first_name':first_name,'last_name':last_name,'contact_number':contact_number,'organization':'http://api.tracepharm.io:8000/organization_category/'+str(organization_id)+'/'}

            # print(data)
            result=requests.post(add_productview_data_url,data)
            # print(result)
            messages.info(request,'Data Uploaded Successfully')
            return render(request,'productmasterdata.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})
        else:
            return render(request,'productmasterdata.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})
    except:
        messages.info(request,'Server not responding')
        return render(request,'productmasterdata.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})





# login view for users
def loginview(request):
    try:
        if request.method == 'POST':
            email = request.POST['email']
            password = request.POST['password']
            data={'email':email,'password':password}
            # import pdb; pdb.set_trace()
            result=requests.post(loginview_url,data)
            res_token=eval(result.text)
            try:
                if res_token['access']:
                    request.session['email'] = res_token,
                    return redirect('/dashboard1',{'res_token':res_token})
                else:
                    messages.info(request,'user password not matching')
                    return redirect('login')
            except:
                messages.info(request,'Please enter correct username and password')
                return redirect('login')
        else:
            return render(request, 'Login.html')
    except:
        return redirect('error')

#  registration part
def registerview(request):
    # import pdb; pdb.set_trace()
    if request.method=="POST":
        username=request.POST.get('username')
        email=request.POST.get('email')
        # alternate_email=request.POST.get('alternate_email')
        designation=request.POST.get('designation')
        password=request.POST.get('password')
        first_name=request.POST.get('first_name')
        last_name=request.POST.get('last_name')
        # alternate_contact_number=request.POST.get('alternate_contact_number')
        contact_number=request.POST.get('contact_number')
        organization_category=request.POST.get('organization_category')


        # data2={'organization_category':organization_category}
        # result_category=requests.post(registerview_data2_url,data2).json()
        data={'username':username,'email':email,'password':password,'designation':designation,'first_name':first_name,'last_name':last_name,'contact_number':contact_number,'organization':organization_category}
        result=requests.post(registerview_data_url,data).json()
        res_token=eval('result')
        # import pdb; pdb.set_trace()
        try:
            if res_token['email']:
                messages.info(request,'Email allready Exists')
                return render(request,'register.html')
            else:
                return render(request,'register.html')
        except:
            messages.info(request,'Registered Successfully Please Login')
            return redirect('/')
    else:
        # messages.error(request,'Please Provide correct details')
        return render(request,'register.html')


def add_userview(request):
    import pdb; pdb.set_trace()
    try:
        if request.method=="POST":
            # import pdb; pdb.set_trace()
            user_name=request.POST.get('username')
            email=request.POST.get('email')
            role=request.POST.get('role')
            alternate_email=request.POST.get('alternateemail')
            # import pdb; pdb.set_trace()
            password=request.POST.get('password')
            first_name=request.POST.get('firstname')
            last_name=request.POST.get('lastname')
            contact_number=request.POST.get('contactnumber')
            user_id=request.POST.get('user_id')
            organization_id=request.POST.get('organization_id')
            # data2={'organization_category':organization_category}
            # result_category=requests.post(add_userview_data2_url,data2).json()
            data={'user_name':user_name,'email':email,'role':role,'alternate_email':alternate_email,'password':password,'first_name':first_name,'last_name':last_name,'contact_number':contact_number,'organization':'http://api.tracepharm.io:8000/organization_category/'+str(organization_id)+'/','add_user':'http://3.239.56.34:8000/update_user/'+str(user_id)+'/'}
            result=requests.post(add_userview_data_url,data)
            messages.info(request,'User Created Successfully')
            return render(request,'add_user.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})
        else:
            return render(request,'add_user.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})
    except:
        messages.info(request,'Server not responding')
        return render(request,'add_user.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def delete(request,id):
    # import pdb; pdb.set_trace()
    requests.delete('http://www.tracepharm.io:8000/update_user/'+str(id)+'/')
    userid = request.session['email']
    resultid=userid[0]
    id=resultid.get('id')
    result = requests.get(manageuser.format(id)).json()
    result2=result.get("user_list")
    messages.info(request,'User Deleted Successfully')
    return render(request,'user_profile.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result2':result2,'res_token':request.session['email'] or ''})

# def updateuser(request, id):
#     if request.method=="PUT":
#         import pdb; pdb.set_trace()
#         username=request.POST.get('username')
#         firstname=request.POST.get('first_name')
#         lastname=request.POST.get('last_name')
#         result=requests.put('http://www.tracepharm.io:8000/update_user/'+str(id)+'/',data={'em_status':em_status,'em_order_number':em_order_number,'em_manufacturer_name':em_manufacturer_name})
#
#         userid = request.session['email']
#         resultid=userid[0]
#         id=resultid.get('id')
#         result = requests.get(manageuser.format(id)).json()
#         result2=result.get("user_list")
#         return render(request,'user_profile.html',{'result2':result2,'res_token':request.session['email'] or ''})
#     else:
#         return render(request,'user_profile.html',{'result2':result2,'res_token':request.session['email'] or ''})




def user_profileview(request):
    # import pdb; pdb.set_trace()
    userid = request.session['email']
    resultid=userid[0]
    id=resultid.get('id')
    result = requests.get(manageuser.format(id)).json()
    result2=result.get("user_list")
    return render(request,'user_profile.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'resultid':resultid,'result2':result2,'res_token':request.session['email'] or ''})




# def add_userview(request):
#     import pdb; pdb.set_trace()
#     pass
#     return render(request,'add_user.html',{'res_token':request.session['email'] or ''})


def business_transactions(request):
    # pass
    try:
        # import pdb; pdb.set_trace()
        product_no = request.POST.get('productno')
        resultproductno = requests.get(orderno_url.format(product_no)).json()
        resultpro=resultproductno.get("transaction_statement")
        result=resultpro[0]
        result2=resultpro[2]
        result1=resultpro[1]
        result.update(result2)
        result.update(result1)
    except:
        return render(request,'error.html')
    else:
        return render(request,'business_transactions.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'product_no':product_no,'result':result,'res_token':request.session['email'] or ''})
    # return render(request,'business_transactions.html',{'res_token':request.session['email'] or ''})

def business_transaction(request):
    # pass
    try:
        # import pdb; pdb.set_trace()
        product_no = request.POST.get('productno')
        resultproductno = requests.get(orderno_url.format(product_no)).json()
        resultpro=resultproductno.get("transaction_statement")
        result=resultpro[0]
        result2=resultpro[2]
        result1=resultpro[1]
        result.update(result2)
        result.update(result1)
    except:
        return render(request,'error.html')
    else:
        return render(request,'business_transaction.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'resultponotify':request.session['res'],'result':result,'res_token':request.session['email'] or ''})
    # return render(request,'busine


def product_identify(request):
    # import pdb; pdb.set_trace()
    productidentify = request.POST.get('productidentify')
    resultproductidentify= requests.get(product_identify_url.format(productidentify)).json()
    result=resultproductidentify.get('partners_list')

    return render(request,'product_identify.html',
    {'result':result,'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def purchase_order(request):
    # import pdb; pdb.set_trace()
    purchase_order = request.POST.get('purchase_order')
    resultpurchaseorder= requests.get(purchase_order_url.format(purchase_order)).json()
    resultpurchase=resultpurchaseorder.get('transaction_history')
    resultpo=resultpurchase[0]
    resultpo1=resultpurchase[1]
    resultpo2=resultpurchase[2]
    resultpo3=resultpurchase[3]
    resultpo4=resultpurchase[4]
    resultpo5=resultpurchase[5]
    resultpo6=resultpurchase[6]
    resultpo.update(resultpo1)
    resultpo.update(resultpo2)
    resultpo.update(resultpo3)
    resultpo.update(resultpo4)
    resultpo.update(resultpo5)
    resultpo.update(resultpo6)
    return render(request,'purchase_order.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'purchase_orderno':purchase_order,'result':resultpo,'res_token':request.session['email'] or ''})



def transaction_partners(request,partner):
    # import pdb; pdb.set_trace()
    partner=partner
    resulttransactionpartner= requests.get(transaction_partner_url.format(partner)).json()
    result=resulttransactionpartner.get('transaction_history')
    print(result)
    # res=resulttransactionpartner[0]
    return render(request,'transaction_partners.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result,'res_token':request.session['email'] or ''})

def transactiondata(request):
    # import pdb; pdb.set_trace()
    from_date = request.POST.get('from_date')
    to_date = request.POST.get('to_date')
    resulttransactiondata= requests.get(transactiondata_date_url.format(from_date,to_date)).json()
    result=resulttransactiondata.get("check")
    return render(request,'transactiondata.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'from_date':from_date,'to_date':to_date,'result':result,'res_token':request.session['email'] or ''})


def business_history(request):
    pass
    return render(request,'business_history.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def smart_contract(request):
    # pass
    # import pdb; pdb.set_trace()
    result = requests.get(smart_contract_list_url).json()
    resultlist=result.get('contract_types')
    contract_type = request.POST.get('contract_type')
    purchase_order_no = request.POST.get('po_number')
    resultponumber= requests.get(smart_contract_ponumber_url.format(purchase_order_no)).json()
    return render(request,'smart_contract.html',{'resultponotify':request.session['res'],'contract_type':contract_type,'result':resultlist,'resultpo':resultponumber,'res_token':request.session['email'] or ''})
    # return render(request,'smart_contract.html',{'res_token':request.session['email'] or ''})

def smart_contract_1(request):
    pass
    return render(request,'smart_contract_1.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def smart_contracts(request):
    # import pdb; pdb.set_trace()
    result = requests.get(smart_contract_list_url).json()
    resultlist=result.get('contract_types')
    contract_type = request.POST.get('contract_type')
    purchase_order_no = request.POST.get('po_number')
    resultponumber= requests.get(smart_contract_ponumber_url.format(purchase_order_no)).json()
    return render(request,'smart_contracts.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'contract_type':contract_type,'result':resultlist,'resultpo':resultponumber,'res_token':request.session['email'] or ''})

def smart_contractspost(request):
    if request.method=="POST":
        # import pdb; pdb.set_trace()
        contract_type=request.POST.get("contract_type")
        purchase_order=request.POST.get("purchase_orderno")
        data={'contract_type':contract_type,'purchase_order':purchase_order}
        result=requests.post(smart_contract_create_url,data).json()
        result = requests.get(smart_contract_list_url).json()
        resultlist=result.get('contract_types')
        return render(request,'smart_contract.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':resultlist,'res_token':request.session['email'] or ''})
        # messages.info(request,'Contract Created Successfully')
    else:
        return render(request,'smart_contract.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})


def manage_smart_contract(request):
    result = requests.get(smart_contract_managelist_url).json()
    result1=result.get('published_contracts')
    return render(request,'manage_smart_contract.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result1,'res_token':request.session['email'] or ''})

def edit_statusview(request,po,id):
    id=id
    po=po
    resultid= requests.get(smart_contract_update_ctype_url.format(id)).json()
    # print(resultid)
    resultponumber= requests.get(smart_contract_ponumber_url.format(po)).json()
    # print(resultponumber)
    return render(request,'smart_contract_1.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'resultid':resultid,'id':id,'resultpo':resultponumber,'res_token':request.session['email'] or ''})

def approve_status(request,id):
    # import pdb; pdb.set_trace()
    # if request.method=="PUT":
    status_approve=request.GET.get("status_approve")
    # purchase_order=request.GET.get("purchase_orderno")
    data={'status':status_approve}
    resultstatus=requests.put(smart_contract_create_url+str(id)+'/',data).json()
    result2 = requests.get(smart_contract_managelist_url).json()
    result3=result2.get('published_contracts')
    return render(request,'manage_smart_contract.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result3,'res_token':request.session['email'] or ''})
    # messages.info(request,'Data Approved Successfully')
    # else:
    #     return render(request,'smart_contract.html',{'res_token':request.session['email'] or ''})


def delete_status(request,id):
    # import pdb; pdb.set_trace()
    requests.delete(smart_contract_create_url+str(id)+'/')
    result = requests.get(smart_contract_managelist_url).json()
    result1=result.get('published_contracts')
    return render(request,'manage_smart_contract.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'result':result1,'res_token':request.session['email'] or ''})
    # messages.info(request,'Record Deleted Successfully')


def smart_contract_3(request):
    pass
    return render(request,'smart_contract_3.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})

def smart_contract_4(request):
    pass
    return render(request,'smart_contract_4.html',{'resultcartcount':request.session['rescount'],'resultponotify':request.session['res'],'res_token':request.session['email'] or ''})










def reset_password(request):
    if request.method == 'POST':
        old_password = request.POST['old_password']
        new_password = request.POST['new_password']
        data={'old_password':old_password,'new_password':new_password}
        result=requests.post(reset_password_data_url,data)
        res_token=eval(result.text)
        # print(res_token)

        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'Your password was successfully updated!')
            return redirect('login')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'accounts/change_password.html', {'form': form})

#  logout view
def logoutview(request):
    # session.pop('email', None)
	# return redirect('/')
    auth.logout(request)
    return redirect('/')

def error_view(request):
    pass
    return render(request,'error.html')

def error2_view(request):
    pass
    return render(request,'error2.html')

def error1_view(request):
    pass
    return render(request,'error1.html')

def resetpasswordview(request):
    pass
    return render(request,'Reset-password.html')

def forgotpasswordview(request):
    pass
    return render(request,'Forgot-password.html')


# mfg search view
# def searchlevelview(request):
#     try:
#         if request.method == 'POST':
#             finalresult={}
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v1/track/dispensers/{}'.format(input_value)
#             response2 = requests.get(root_url).json()
#             for value in response2.get('Transaction'):
#                 for key in value.keys():
#                     finalresult[key]=value.get(key)
#             return render(request,'searchlevel.html',{'response2':finalresult,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'tracktrace.html')
#     except:
#         return render(request,'tracktrace.html')

#
# def searchlevelview(request):
#     try:
#         if request.method == 'POST':
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v2/track/identification/{}'.format(input_value)
#             print(root_url)
#             response2 = requests.get(root_url).json()
#             return render(request,'searchlevel.html',{'response2':response2,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'tracktrace.html')
#     except:
#         return render(request,'tracktrace.html')

# def searchlevel(request):
#    result=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#    final_resut=[]
#    for res in result:
#        #import pdb; pdb.set_trace()
#        if request.GET.get('searchlevel') in res['product']['product_code_gtin']:
#            final_resut.append(res)
#    return render(request,'searchlevel.html',{'response2':final_resut,'res_token':request.session['email'] or ''})



# def searchresultview(request):
#     try:
#         if request.method == 'POST':
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = searchresult_url.format(input_value)
#             response2 = requests.get(root_url).json()
#             return render(request,'searchresult.html',{'response2':response2,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'tracktrace.html')
#     except:
#         return render(request,'tracktrace.html')
#

#
# def searchunitlevelview(request):
#     try:
#         if request.method == 'POST':
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v2/track/identification/{}'.format(input_value)
#             response2 = requests.get(root_url).json()
#             return render(request,'searchunitlevel.html',{'response2':response2,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'tracktrace.html')
#     except:
#         return render(request,'tracktrace.html')
#
# def searchcaselevelview(request):
#     try:
#         if request.method == 'POST':
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v2/track/identification/{}'.format(input_value)
#
#             response2 = requests.get(root_url).json()
#             return render(request,'searchcaselevel.html',{'response2':response2,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'tracktrace.html')
#     except:
#         return render(request,'tracktrace.html')
#



#
# def searchcaselevelview(request):
#     result=requests.get('http://3.239.56.34:8000/package_case_info/').json()
#     final_resut=[]
#     for res in result:
#         #import pdb; pdb.set_trace()
#         if request.GET.get('searchcaselevel') in str(res['package_case_serial_number']):
#             final_resut.append(res)
#     return render(request,'searchcaselevel.html',{'result':final_resut,'res_token':request.session['email'] or ''})


#
# def manufacturer_order_update(request):
#     import pdb; pdb.set_trace()
#     if request.method=="POST":
#         # serial_number=request.POST.get('serial_number')
#         # brand_name=request.POST.get('brand_name')
#         #product elements
#         product_name=request.POST.get('product_name')
#         mfg_date=request.POST.get('mfg_date')
#         expiry_date=request.POST.get('expiry_date')
#         product_description=request.POST.get('product_description')
#         strength=request.POST.get('strength')
#         batch_number=request.POST.get('batch_number')
#         patient_instruction=request.POST.get('patient_instruction')
#         product_code_gtin=request.POST.get('product_code_gtin')
#         product_ndc=request.POST.get('product_ndc')
#         product_code_type=request.POST.get('product_code_type')
#
#         #product dispatch elements
#         # packaging_time=request.POST.get('packaging_time')
#         # package_type=request.POST.get('package_type')
#         # package_dimentions=request.POST.get('package_dimentions')
#
#         #package pallet elements
#         package_pallet_sn=request.POST.get('package_pallet_sn')
#         inner_package_count=request.POST.get('inner_package_count')
#
#         # import pdb; pdb.set_trace()
#         productdata={'product_name': product_name,'mfg_date': mfg_date,'expiry_date': expiry_date,'product_description':product_description,'strength':strength,'batch_number':batch_number,'patient_instruction':patient_instruction,'product_code_gtin':product_code_gtin,'product_ndc':product_ndc,'product_code_type':product_code_type}
#         result=requests.post(manufacturer_order_update_productdata_url,productdata).json()
#
#         # productdispatch={'packaging_time': packaging_time,'package_type':package_type,'package_dimentions':package_dimentions,'product':result['url']}
#         # result1=requests.post('http://3.239.56.34:8000/product_dispatch/',productdispatch).json()
#
#         packagepallet={'package_pallet_sn': package_pallet_sn,'inner_package_count':inner_package_count,'product':result['url']}
#         result2=requests.post(manufacturer_order_update_packagepallet_url,packagepallet).json()
#         #case  elements
#         # for value in range(1,6):
#         #     package_case_sn = request.POST.get('package_case_sn'+str(value))
#         #     parent_pallet_package_id=request.POST.get('parent_pallet_package_id'+str(value))
#         #     package_type=request.POST.get('package_type'+str(value))
#         import time
#         for value in range(1,3):
#             package_case_sn = request.POST.get('package_case_sn'+str(value))
#             parent_pallet_package_id=request.POST.get('parent_pallet_package_id'+str(value))
#             package_type=request.POST.get('package_type'+str(value))
#             casedata={'package_case_sn': package_case_sn,'parent_pallet_package_id':parent_pallet_package_id,'package_type':package_type,'parent_pallet_package':result2['url']}
#             result3=requests.post('http://3.239.56.34:8000/package_cases/',casedata).json()
#             time.sleep(1)
#         #unit  elements
#         for value in range(1,6):
#             package_sn=request.POST.get('package_sn'+str(value))
#             inner_package_count=request.POST.get('inner_package_count'+str(value))
#             unitdata={'package_sn': package_sn,'inner_package_count':inner_package_count,'parent_package_case':result3['url']}
#             result4=requests.post('http://3.239.56.34:8000/package_units/',unitdata).json()
#             time.sleep(1)
#
#         return redirect("/manufacturer_order_details")
#     else:
#         return render(request,'manufacturer_order_details.html')

#
# def distributor_order_details_view(request):
#     # import  pdb;pdb.set_trace()
#     result_old=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#     result=[]
#     for row in result_old:
#         if row['product_disp']['order_status']=='In Transit':
#             result.append(row)
#     return render(request,'distributor_order_details.html',{'result':result,'res_token':request.session['email'] or ''})
#
#  # Manufacturer details Showing api view
# def distributor_order_details_edit_view(request,id):
#     # import pdb; pdb.set_trace()
#     result=requests.get('http://3.239.56.34:8000/package_pallet_info/'+str(id)+'/').json()
#     return render(request,'distributor_order_details_edit.html',{'result':result,'res_token':request.session['email'] or ''})
#
#
# def distributor_order_update(request):
#     result_old=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#     for row in result_old:
#         # import pdb; pdb.set_trace()
#         # if row['product_disp']['sscc_no']==str(id):
#         if row['product_disp']['sscc_no']==request.GET.get('sscc_no'):
#             # import pdb; pdb.set_trace()
#             sscc_no=request.GET.get('sscc_no')
#             current_location=request.GET.get('current_location')
#             asset_owner_now=request.GET.get('asset_owner_now')
#             order_status=request.GET.get('order_status')
#             transaction_type=request.GET.get('transaction_type')
#             current_owner_contact=request.GET.get('current_owner_contact')
#             current_owner_address=request.GET.get('current_owner_address')
#
#             location={'current_location': current_location}
#             result=requests.put(row['product_disp']['location']['url'],location).json()
#             owner={'asset_owner_now': asset_owner_now,'transaction_type':transaction_type,'current_owner_contact':current_owner_contact,'current_owner_address':current_owner_address}
#             result1=requests.put(row['product_disp']['owner']['url'],owner).json()
#             status={'order_status': order_status}
#             result2=requests.put(row['product_disp']['url'],status).json()
#     return redirect("/distributor_order_details")

# def distributor_order_update(request,id):
#     result_old=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#     for row in result_old:
#         if row['product_disp']['sscc_no']==str(id):
#             row['product_disp']['order_status']="delivered"
#             order_status=row['product_disp']['order_status']
#             print(order_status)
#             link=row['product_disp']['url']
#             print(link)
#             order={'order_status': order_status}
#             requests.put(link,data = order)
#             break
#     return redirect("/distributor_order_details")
# Logistic details getting from manufacturer api view
# def logistics_order_details_view(request):
#     # import  pdb;pdb.set_trace()
#     result_old=requests.get('http://18.207.255.94:8000/manufacturer_drug/').json()
#     result=[]
#     for row in result_old:
#         if row['em_status']=='HandoffToRetailer':
#             result.append(row)
#
#     return render(request,'logistics_order_details.html',{'result':result})
#
# # Logistics details Showing api view
# def logistics_order_details_edit_view(request,id):
#     result=requests.get('http://18.207.255.94:8000/manufacturer_drug/'+str(id)+'/').json()
#     return render(request,'logistics_order_details_edit.html',{'result':result})
#
# # Logistics details Submitting from manufacturer api to trace form api view
# def logistics_order_update(request):
#
#     result_old=requests.get('http://18.207.255.94:8000/tracepharm/').json()
#     result=[]
#     for row in result_old:
#         #import pdb; pdb.set_trace()
#         if row['em_sscc']==request.GET.get('em_sscc'):
#
#             # import pdb; pdb.set_trace()
#             em_sscc=request.GET.get('em_sscc')
#             em_truck_no=request.GET.get('em_truck_no')
#             # import pdb; pdb.set_trace()
#             em_gtin=request.GET.get('em_gtin')
#             em_pallet_no=request.GET.get('em_pallet_no')
#             em_mfg_date=request.GET.get('em_mfg_date')
#             em_expiry_date=request.GET.get('em_expiry_date')
#             em_gln=request.GET.get('em_gln')
#             em_drug_name=request.GET.get('em_drug_name')
#             em_batch_no=request.GET.get('em_batch_no')
#             em_drug_type=request.GET.get('em_drug_type')
#             em_status=request.GET.get('em_status')
#             em_ndc=request.GET.get('em_ndc')
#             em_strength=request.GET.get('em_strength')
#             em_product_description=request.GET.get('em_product_description')
#             em_patient_instruction=request.GET.get('em_patient_instruction')
#             em_destination=request.GET.get('em_destination')
#             em_mfg_name=request.GET.get('em_mfg_name')
#             em_packing_level=request.GET.get('em_packing_level')
#             em_container_size=request.GET.get('em_container_size')
#             em_inner_content=request.GET.get('em_inner_content')
#             # em_mfg_name=request.POST.get('em_mfg_name')
#             em_destination=request.GET.get('em_destination')
#             em_transporter=request.GET.get('em_transporter')
#             em_retailer_name=request.GET.get('em_retailer_name')
#             em_order_no=request.GET.get('em_order_no')
#             em_last_updated1=request.GET.get('em_last_updated1')
#             em_current_owner=request.GET.get('em_current_owner')
#             em_previous_owner=request.GET.get('em_previous_owner')
#
#             # import pdb;pdb.set_trace()
#
#             result=requests.put(row['url'],data={'em_sscc': em_sscc,
#             'em_gtin': em_gtin,
#             'em_mfg_date': em_mfg_date,
#             'em_expiry_date': em_expiry_date,
#             'em_gln':em_gln,
#             'em_batch_no':em_batch_no,
#             'em_pallet_no':em_pallet_no,
#             'em_drug_name':em_drug_name,
#             'em_drug_type':em_drug_type,
#             'em_status':em_status,
#             'em_ndc':em_ndc,
#             'em_strength':em_strength,
#             'em_product_description':em_product_description,
#             'em_patient_instruction':em_patient_instruction,
#             'em_destination':em_destination,
#             'em_mfg_name':em_mfg_name,
#             'em_packing_level':em_packing_level,
#             'em_container_size':em_container_size,
#             'em_inner_content':em_inner_content,
#             # 'em_mfg_name':em_mfg_name,
#             'em_destination':em_destination,
#             'em_transporter':em_transporter,
#             'em_retailer_name':em_retailer_name,
#             'em_order_no':em_order_no,
#             'em_last_updated1':em_last_updated1,
#             'em_current_owner':em_current_owner,
#             'em_previous_owner':em_previous_owner})
#
#     return redirect("/logistics_order_details")
#



# def retailer_order_details_view(request):
#     # import  pdb;pdb.set_trace()
#     result_old=requests.get('http://18.207.255.94:8000/manufacturer_drug/').json()
#     result=[]
#     for row in result_old:
#         if row['em_status']=='HandoffToRetailer':
#             result.append(row)
#
#     return render(request,'retailer_order_details.html',{'result':result})
#
# def retailer_order_details_edit_view(request,id):
#     result=requests.get('http://18.207.255.94:8000/manufacturer_drug/'+str(id)+'/').json()
#     return render(request,'retailer_order_details_edit.html',{'result':result})
#
# def retailer_order_update(request):
#     # import pdb; pdb.set_trace()
#     if request.method=="POST":
#         em_sscc=request.POST.get('em_sscc')
#         em_gtin=request.POST.get('em_gtin')
#         em_mfg_date=request.POST.get('em_mfg_date')
#         em_expiry_date=request.POST.get('em_expiry_date')
#         result=requests.post('http://18.207.255.94:8000/tracepharm/',data={'em_sscc': em_sscc,
#             'em_gtin': em_gtin,
#             'em_mfg_date': em_mfg_date,
#             'em_expiry_date': em_expiry_date})
#         return redirect("/retailer_order_details")
#     else:
#         return render(request,'retailer_order_details.html')


#
# def retailer_order_details_view(request):
#     # import  pdb;pdb.set_trace()
#     result_old=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#     result=[]
#     for row in result_old:
#         if row['product_disp']['order_status']=='In Transit':
#             result.append(row)
#     return render(request,'retailer_order_details1.html',{'result':result,'res_token':request.session['email'] or ''})
#
# def retailer_order_update(request):
#     result_old=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#     for row in result_old:
#         # import pdb; pdb.set_trace()
#         # if row['product_disp']['sscc_no']==str(id):
#         if row['product_disp']['sscc_no']==request.GET.get('sscc_no'):
#             # import pdb; pdb.set_trace()
#             sscc_no=request.GET.get('sscc_no')
#             current_location=request.GET.get('current_location')
#             asset_owner_now=request.GET.get('asset_owner_now')
#             order_status=request.GET.get('order_status')
#             transaction_type=request.GET.get('transaction_type')
#             current_owner_contact=request.GET.get('current_owner_contact')
#             current_owner_address=request.GET.get('current_owner_address')
#
#             location={'current_location': current_location}
#             result=requests.put(row['product_disp']['location']['url'],location).json()
#             owner={'asset_owner_now': asset_owner_now,'transaction_type':transaction_type,'current_owner_contact':current_owner_contact,'current_owner_address':current_owner_address}
#             result1=requests.put(row['product_disp']['owner']['url'],owner).json()
#             status={'order_status': order_status}
#             result2=requests.put(row['product_disp']['url'],status).json()
#     return redirect("/retailer_order_details1")
#


# def trace_identification(request):
#     result=requests.get('http://54.196.204.11:8082/identification/internal/').json()
#     final_resut=[]
#     for res in result:
#         #import pdb; pdb.set_trace()
#         if request.GET.get('trace_identification') in res['disptch']['sscc_no']:
#             final_resut.append(res)
#         if request.GET.get('trace_identification') in res['package_case']['package_case_serial_number']:
#             final_resut.append(res)
#         if request.GET.get('trace_identification') in res['package_unit']['package_sn']:
#             final_resut.append(res)
#
#     return render(request,'trace_identification.html',{'result':final_resut,'res_token':request.session['email'] or ''})

# def retailertraceview(request):
#     try:
#         if request.method == 'POST':
#             finalresult={}
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v1/trace/{}'.format(input_value)
#             response2 = requests.get(root_url).json()
#             for value in response2.get('Transaction'):
#                 for key in value.keys():
#                     finalresult[key]=value.get(key)
#             return render(request,'tracenew.html',{'response2':finalresult,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'retailtrace.html')
#     except:
#         return render(request,'retailtrace.html')

# def distributortraceview(request):
#     try:
#         if request.method == 'POST':
#             finalresult={}
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v1/trace/{}'.format(input_value)
#             response2 = requests.get(root_url).json()
#             for value in response2.get('Transaction'):
#                 for key in value.keys():
#                     finalresult[key]=value.get(key)
#             return render(request,'tracenew.html',{'response2':finalresult,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'distributortrace.html')
#     except:
#         return render(request,'distributortrace.html')

# def retailertraceview(request):
#     result=requests.get('http://3.239.56.34:8000/dispatch_packages/').json()
#     final_resut=[]
#     for res in result:
#         #import pdb; pdb.set_trace()
#         if request.GET.get('retailertrace') in res['package_unit']['package_sn']:
#             final_resut.append(res)
#
#     return render(request,'retailertrace.html',{'result':final_resut,'res_token':request.session['email'] or ''})


# def lsp_identification(request):
#     try:
#         if request.method == 'POST':
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8082/api/v1/track/dispensers/{}'.format(input_value)
#             print(root_url)
#             response2 = requests.get(root_url).json()
#             return render(request,'lsp_identification.html',{'response2':response2,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'lsp_identification.html')
#     except:
#         return render(request,'lsp_identification.html',{'result':final_resut,'res_token':request.session['email'] or ''})


# def lsp_identification(request):
#     result=requests.get('http://3.239.56.34:8000/package_pallet_info/').json()
#     final_resut=[]
#     for res in result:
#
#         if request.GET.get('lsp_identification') in res['product_disp']['sscc_no']:
#             final_resut.append(res)
#         if request.GET.get('lsp_identification') in str(res['package_pallet_sn']):
#             final_resut.append(res)
#     return render(request,'lsp_identification.html',{'result':final_resut,'res_token':request.session['email'] or ''})
#
#
# def distributor_identification(request):
#     result=requests.get('http://3.239.56.34:8000/package_case_info/').json()
#     final_resut=[]
#     for res in result:
#         if request.GET.get('distributor_identification') in res['parent_pallet_package']['product_disp']['sscc_no']:
#             final_resut.append(res)
#         if request.GET.get('distributor_identification') in str(res['package_case_sn']):
#             final_resut.append(res)
#         if request.GET.get('distributor_identification') in str(res['parent_pallet_package']['package_pallet_sn']):
#             final_resut.append(res)
#     return render(request,'distributor_identification.html',{'result':final_resut,'res_token':request.session['email'] or ''})
#
# def retailer_identification(request):
#     result=requests.get('http://identificationv2.us-e2.cloudhub.io/exp_identification/').json()
#     final_resut=[]
#     for res in result:
#         if request.GET.get('retailer_identification') in res['package_unit']['package_sn']:
#             final_resut.append(res)
#         if request.GET.get('retailer_identification') in res['package_case']['package_case_serial_number']:
#             final_resut.append(res)
#         # if request.GET.get('retailer_identification') in res['package_pallet']['package_pallet_sn']:
#         #     final_resut.append(res)
#
#     return render(request,'retailer_identification.html',{'result':final_resut,'res_token':request.session['email'] or ''})
#

# def show(request):
#     try:
#         # import pdb; pdb.set_trace()
#         result=requests.get('http://identificationv2.us-e2.cloudhub.io/exp_identification/').json()
#         # return render(request,'show.html',{'result':result,'res_token':request.session['email'] or ''})
#         # result = requests.get('http://tracepharm.us-e2.cloudhub.io/api/v1/packages/dispatch_products').json()
#         return render(request,'show.html',{'result':result, 'res_token':request.session['email'] or ''})
#     except:
#         return redirect("/show")

# def verification(request):
#     try:
#         if request.method == 'POST':
#             # import pdb; pdb.set_trace()
#             input_value = request.POST.get("input")
#             root_url = 'http://54.196.204.11:8081/api/v1/product_verify/{}'.format(input_value)
#             root_url1 = 'http://54.196.204.11:8081/api/v1/pallet_verify/{}'.format(input_value)
#             root_url2 = 'http://54.196.204.11:8081/api/v1/owner_verify/{}'.format(input_value)
#             root_url3 = 'http://54.196.204.11:8081/api/v1/unit_verify/{}'.format(input_value)
#             root_url4 = 'http://54.196.204.11:8081/api/v1/location_verify/{}'.format(input_value)
#             response2 = requests.get(root_url).json()
#             response1 = requests.get(root_url1).json()
#             response3 = requests.get(root_url2).json()
#             response4 = requests.get(root_url3).json()
#             response5 = requests.get(root_url4).json()
#             response2.update(response1)
#             response2.update(response3)
#             response2.update(response4)
#             response2.update(response5)
#             # result=requests.post('http://ec2-54-196-204 -11.compute-1.amazonaws.com:8081/location_verfication').json()
#             # return render(request,'verification.html',{'response2':response2, 'res_token':request.session['email'] or ''})
#             return render(request,'verification.html',{'response2':response2,'res_token':request.session['email'] or ''})
#         else:
#             return render(request,'verify.html')
#     except:
#         return redirect("/verify")




# def registerform1view(request):
#     if request.method=="POST":
#         # import pdb; pdb.set_trace()
#         company_category=request.POST.get('company_category')
#         company_name=request.POST.get('company_name')
#         registration_no=request.POST.get('registration_no')
#         telephone=request.POST.get('telephone')
#         taxcode=request.POST.get('taxcode')
#         contact_role=request.POST.get('contact_role')
#
#         street_address1=request.POST.get('street_address1')
#         street_address2=request.POST.get('street_address2')
#         city=request.POST.get('city')
#         postal_code=request.POST.get('postal_code')
#         country_code=request.POST.get('country_code')
#
#         user_id=request.POST.get('user_id')
#         data1={'street_address1':street_address1,'street_address2':street_address2,'city':city,'postal_code':postal_code,'country_code':country_code}
#         result_reg_adress=requests.post('http://3.239.56.34:8000/company_registration_address/',data1).json()
#         data2={'company_category':company_category}
#         result_category=requests.post('http://3.239.56.34:8000/company_category/',data2).json()
#         data={'company_name':company_name,'registration_no':registration_no,
#         'telephone':telephone,'taxcode':taxcode,'contact_role':contact_role,'gs1_address':result_reg_adress['url'],'company_category':company_category,
#         'api_user':'http://3.239.56.34:8000/addusers/'+str(user_id)+'/'}
# # remove company category from this view check when necessary
#         result=requests.post('http://3.239.56.34:8000/company_registration/',data)
#         return redirect('/registerform_1')
#     else:
#         return render(request,'Register-form-1.html')

# def registerform_idview(request):
#     pass
#     return render(request,'Register-form-1.html',{'res_token':request.session['email'] or ''})

# registring personal details page2 view
# def registerform2view(request):
#     # import pdb; pdb.set_trace()
#     if request.method=="POST":
#         em_product_name=request.POST.get('em_product_name')
#         em_product_description=request.POST.get('em_product_description')
#         em_brand=request.POST.get('em_brand')
#         em_sub_classification=request.POST.get('em_sub_classification')
#         em_dosage=request.POST.get('em_dosage')
#         em_additional_information=request.POST.get('em_additional_information')
#         em_full_name=request.POST.get('em_full_name')
#         em_designation=request.POST.get('em_designation')
#         em_contact_number=request.POST.get('em_contact_number')
#         em_alternate_number=request.POST.get('em_alternate_number')
#         em_email_address=request.POST.get('em_email_address')
#         em_alternate_email_address=request.POST.get('em_alternate_email_address')
#         em_department=request.POST.get('em_department')
#         # em_department=request.POST.get('em_department')
#
#
#         data={'em_product_name':em_product_name,'em_product_description':em_product_description,'em_brand':em_brand,'em_sub_classification':em_sub_classification,'em_full_name':em_full_name,'em_designation':em_designation,'em_contact_number':em_contact_number,'em_alternate_number':em_alternate_number,'em_email_address':em_email_address,'em_alternate_email_address':em_alternate_email_address,'em_department':em_department}
#         result=requests.post('http://18.207.255.94:8000/product_details/',data)
#         return redirect('/')
#     else:
#         return render(request,'Registration-form-2.html')
