// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {

  $( "#catalog li" ).draggable({
    appendTo: "body",
    helper: "clone"
  });

  $( "#cart ul" ).droppable({
    activeClass: "ui-state-default",
    hoverClass: "ui-state-hover",
    accept: ":not(.ui-sortable-helper)",
    drop: function( event, ui ) {
      $( this ).find( ".placeholder" ).remove();
      $( "<li></li>" ).text( ui.draggable.text() ).attr("id", ui.draggable.prop('id')).appendTo( this );
    }
  }).sortable({
    items: "li:not(.placeholder)",
    sort: function() {
      // gets added unintentionally by droppable interacting with sortable
      // using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
      $( this ).removeClass( "ui-state-default" );
    }
  });


  var amoebas = []; //create an empty slide array
  var act_id = $("#act_id").attr("value");

  $("#update_button").click(function(){
      $("#new_amoebas li").each(function(index){
        var amoeba_id = $(this).attr('id');
        amoebas.push({amoeba_id: amoeba_id}); //track new position by index in array.
      });

    var data = {"amoebas":amoebas, "act_id":act_id};
    $.post( '/acts_ajax', data, function(new_amoebas){

    $('#associated').empty();

    $(new_amoebas).each(function(i, amoeba) {
      $('#associated').append('<li><a href="/amoebas/'+amoeba.id+'">'+amoeba.name+'</a></li>');
     });
    });

    $('#new_amoebas').html('<li class="placeholder">Drag Amoebas Here to Add Them to the Act!</li>');

  });

});