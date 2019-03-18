// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load',function(){
  $("input[type = 'radio']").change(function(){
    if (this.checked)
    {
      var radioValue = $(this).val();
      var radioName = $(this).attr('name');
      $(":input[type = 'radio'][name="+radioName+"][value="+radioValue+"]").not(this).attr('checked', false);
    }
  });
});

// $(document).on('turbolinks:load',function(){
//   $("input[type = 'radio']").change(function(){
//     if (this.checked)
//     {
//       var radioValue = $(this).val();
//       var radioName = $(this).attr('name');
//       var valsplit = radioValue.split(" ");
//       //alert(valsplit[valsplit.length - 1]);
//       var radios = document.getElementsByName(radioName)
//       console.log(radios)
//       for (i=0; i< radios.length; i++ ){
//         if (( radios[i]!=this) && (radios[i].value.includes(valsplit[valsplit.length - 1]))) {
//           radios[i].checked = true
//         }
//       }
//       //($(":input[type = 'radio']").not(this)&&($(":input[type = 'radio']").val().includes(valsplit[valsplit.length - 1])==true)).attr('checked', true);
//     }
//   });
// });
