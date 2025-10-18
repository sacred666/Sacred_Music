@Component
export struct recommend {
  swiperList: string[] = [
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner1.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner2.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner3.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner4.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner5.png"
  ]
build() {
  Column({space:10}){
    Row() {
Image($r("app.media.ic_research"))
  .width(22)
  .fillColor('#817D83')
      TextInput({placeholder:'只因你太美 🔥'})
        .placeholderColor('#817D83')
        .padding({left: 5})
        .fontColor('#999')
        .layoutWeight(1)
      Image($r('app.media.ic_code'))
        .width(20)
        .fillColor('#817D83')
    }
    .width('100%')
    .backgroundColor('#2D2B29')
    .border({radius: 20})
    .padding({left: 8, right: 8})
    Swiper(){
      ForEach(this.swiperList,(item:string)=>{
        Image(item)
          .width("100%")
          .border({radius:10})
      })
    }
    .autoPlay(true)
  }
  .width("100%")
  .height("100%")

}
  }
