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
    var margin = 10;
    var already = 1;
    console.log("XXX")
    var li=$("article");
    var li_W = li[0].offsetWidth+margin;
    function liuxiaofan(){
      var h=[];
      var n = document.documentElement.offsetWidth/li_W|0;
      for(var i = 0;i < li.length;i++) {
            li_H = li[i].offsetHeight;
            console.log(li[i].offsetHeight)
          if(i < n) {
                h[i]=li_H;
                li.eq(i).css("top",0);
                li.eq(i).css("left",i * li_W);
              }
          else{
                min_H =Math.min.apply(null,h) ;
                minKey = getarraykey(h, min_H);
                h[minKey] += li_H+margin ;
                li.eq(i).css("top",min_H+margin);
                li.eq(i).css("left",minKey * li_W);
                if (i>(already-1)*10&&i<already*10&&already!=1){
                      li.eq(i).show();
                    }
                if(already==1&&i>already*10){
                      li.eq(i).hide();
                    }
                }
          }
      }
  function getarraykey(s, v) {for(k in s) {if(s[k] == v) {return k;}}}
    window.onload = function() {liuxiaofan();};
    window.onresize = function() {liuxiaofan();}; 
    $(window).scroll(function(){
      var documentTop = $(document).scrollTop();
      var windowHeight = $(window).height();
      var documentHeight = $(document).height();
    //var txt = "windowHeight:"+windowHeight + " |*$*| documentTop:"+documentTop + " |*$*| documentHeight:"+documentHeight;
    //当 documentTop >= (documentHeight-windowHeight) 说明滚动条已经滚动到底部了
      if(documentTop >= (documentHeight-windowHeight)){
         already++;
         liuxiaofan();
    }
  })  
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
    
    });
