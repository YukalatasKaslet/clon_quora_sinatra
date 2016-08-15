$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 
  $( document.body ).find("#show").click(function() {
    $( "#show_all_questions" ).fadeIn( "slow" );
    $( this ).empty();
    $( document.body ).find( "#hide" ).append( "<strong> Ocultar preguntas </strong>" );
  });

  $( document.body ).find("#hide").click(function() {
    $( "#show_all_questions" ).fadeOut( "slow" );
    $( this ).empty();
    $( document.body ).find( "#show" ).append( "<strong> Mostrar todas las preguntas </strong>" );
  });

});//document.ready end
