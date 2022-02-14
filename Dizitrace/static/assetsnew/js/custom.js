// autocomplete functionality
    if (jQuery('input#add-autocomplete').length > 0) {
        jQuery('input#add-autocomplete').typeahead({
          displayText: function(item) {
               return item.gtin
          },
          afterSelect: function(item) {
                this.$element[0].value = item.gtin;
                jQuery("input#field-autocomplete").val(item.id);
          },
          source: function (query, process) {
            jQuery.ajax({
                    url: baseurl + "productTnT/getGtinData/",
                    data: {query:query},
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
                        process(data)
                    }
                })
          }   
        });
    }