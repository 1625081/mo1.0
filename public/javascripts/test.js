console.log('abc')
$(document)
  .ready(function() {
    console.log('xx')
    $('.bo2').hide();
    $('.bo3').hide();
    $('.bo4').hide();
    $('.bo5').hide();
    $('.bo6').hide();
    $('.bo7').hide();
    $('.bo1').mouseover(function(){
      $('.bo2').fadeIn(3000,function(){
        $('.bo3').fadeIn(3000,function(){
          $('.bo4').fadeIn(3000,function(){
            $('.bo5').fadeIn(3000);
            $('.bo6').fadeIn(3000,function(){
              $('.bo7').fadeIn(3000);
            });
          });
        });
      });
    });
    function fadebo2(){
      $('.bo3').fadeIn();
    }
    var
      changeSides = function() {
        $('.ui.shape')
          .eq(0)
            .shape('flip over')
            .end()
          .eq(1)
            .shape('flip over')
            .end()
          .eq(2)
            .shape('flip back')
            .end()
          .eq(3)
            .shape('flip back')
            .end()
        ;
      };

    $('.ui.dropdown')
      .dropdown({
        on: 'hover'
      })
    ;

    $('.ui.form')
      .form(validationRules, {
        on: 'blur'
      })
    ;

    $('.masthead .information')
      .transition('scale in')
    ;

    setInterval(changeSides, 3000);

    $('.catchme').click(function(){
      $(this).hide();});
    }
  )
;
