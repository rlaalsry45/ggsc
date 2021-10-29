
function today(id){
    $('#'+id).daterangepicker({
        singleDatePicker: true,
        singleClasses: "picker_4",
        locale: {
            format: 'YYYY-MM-DD'
          }
      }, function(start, end, label) {
        console.log(start.toISOString(), end.toISOString(), label);
      });
}