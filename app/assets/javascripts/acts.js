// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {

  function updateAct(){
    $.ajax({
       type: "POST",
       url: "/acts/1",
       data: "data="
       });
      }

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


  $("#update_button").click(function(){
    $("#new_amoebas").updateAct();
  });



});