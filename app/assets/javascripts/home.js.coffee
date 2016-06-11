#= require qiniu_direct_uploader

  $(document).on "page:change", ->
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

    $('#Mgirl').popup on: 'hover'
    
    setInterval(changeSides, 3000)

    $('.catchme').click(  
      ()->
        $(this).hide()
    )

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