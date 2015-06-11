#= require qiniu_direct_uploader

  $(document).ready ->
    photoForm = $("form#photograph-uploader")
    if photoForm.length > 0
      photoForm.QiniuUploader
      # see also  https://github.com/blueimp/jQuery-File-Upload/wiki/Options
        autoUpload: true
        singleFileUploads: false
        limitMultiFileUploads: 2
        customCallbackData: {"xyz": 100}
        onFilesAdd: (file) ->
          if file.type != "image/jpeg" and file.type != "image/png" and file.type != "image/gif"
            alert('please select image')
            return false
          else
            return true

      photoForm.bind "ajax:success", (e, data) ->
        console.log('success')
        console.log(data)

      photoForm.bind "ajax:failure", (e, data) ->
        console.log('failure')
        console.log(data)
    
    console.log('xx')
    already = 0
    $('.bo2').hide()
    $('.bo3').hide()
    $('.bo4').hide()
    $('.bo5').hide()
    $('.bo6').hide()
    $('.bo7').hide()
    changeSides = ->
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
          
    $('.ui.dropdown').dropdown on: 'hover'

    $('.masthead .information').transition('scale in')


    setInterval(changeSides, 3000)

    $('.catchme').click(  
      ()->
        $(this).hide()
    )
    margin = 10
    already = 1
    console.log("XXX")
    li = $("article")
    li_W = li[0].offsetWidth+margin
    liuxiaofan = () ->
      h = []
      n = document.documentElement.offsetWidth/li_W|0
      for element , i in li
          li_H = li[i].offsetHeight
          if i < n  
            h[i] = li_H
            li.eq(i).css("top",0)
            li.eq(i).css("left",i * li_W)
          else
            min_H = Math.min.apply(null,h)
            minKey = getarraykey(h, min_H)
            h[minKey] += li_H+margin
            li.eq(i).css("top", min_H + margin)
            li.eq(i).css("left", minKey * li_W)
            #if i>(already-1)*10&&i<already*10&&already!=1
            #  li.eq(i).show()
            #if already==1&&i>already*10
            #  li.eq(i).hide()                
    getarraykey = (s, v) -> 
      for k , len in s 
        if k == v
          return len
    window.onload = () ->
      liuxiaofan()
    window.onresize = () ->
      liuxiaofan() 
  
  
  $(window).scroll ( 
    () ->
      documentTop = $(document).scrollTop()
      windowHeight = $(window).height()
      documentHeight = $(document).height()
      #var txt = "windowHeight:"+windowHeight + " |*$*| documentTop:"+documentTop + " |*$*| documentHeight:"+documentHeight;
      #当 documentTop >= (documentHeight-windowHeight) 说明滚动条已经滚动到底部了
      if documentTop >= (documentHeight-windowHeight)
        #already++
        #liuxiaofan()
        $('.bo2').fadeIn(1000,() ->
         $('.bo3').fadeIn(1000,() ->
          $('.bo4').fadeIn(1000,() ->
            $('.bo5').fadeIn(1000)
            $('.bo6').fadeIn(1000,() ->
              $('.bo7').fadeIn(3000)
            )
          )
         )
        )
  )
  #Image system