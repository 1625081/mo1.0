var margin = 10;
  var li=$("article");
  var li_W = li[0].offsetWidth+margin;
  function liuxiaofan(){
    var h=[];
    var n = document.documentElement.offsetWidth/li_W|0;
      for(var i = 0;i < li.length;i++) {
            li_H = li[i].offsetHeight;
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
             }
          }
      }
  function getarraykey(s, v) {for(k in s) {if(s[k] == v) {return k;}}}
  window.onload = function() {liuxiaofan();};
  window.onresize = function() {liuxiaofan();}; 