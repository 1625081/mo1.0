console.log('abc')
$(document).ready(function() {
    console.log('xx')
    var already = 0;
    $('.bo2').hide();
    $('.bo3').hide();
    $('.bo4').hide();
    $('.bo5').hide();
    $('.bo6').hide();
    $('.bo7').hide();
    var changeSides = function() {
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
      }

    $('.ui.dropdown')
      .dropdown({
        on: 'hover'
      })
    ;


    $('.masthead .information')
      .transition('scale in')
    ;

    setInterval(changeSides, 3000);

    $('.catchme').click(function(){
      $(this).hide();});
    }
  );
  $(window).scroll(function(){
    var documentTop = $(document).scrollTop();
    var windowHeight = $(window).height();
    var documentHeight = $(document).height();
    //var txt = "windowHeight:"+windowHeight + " |*$*| documentTop:"+documentTop + " |*$*| documentHeight:"+documentHeight;
    //当 documentTop >= (documentHeight-windowHeight) 说明滚动条已经滚动到底部了
    if(documentTop >= (documentHeight-windowHeight)){
        $('.bo2').fadeIn(1000,function(){
        $('.bo3').fadeIn(1000,function(){
          $('.bo4').fadeIn(1000,function(){
            $('.bo5').fadeIn(1000);
            $('.bo6').fadeIn(1000,function(){
              $('.bo7').fadeIn(3000);
              });
            });
          });
        });
      }
    
    })
