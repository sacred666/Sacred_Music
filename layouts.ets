import { TabBarPosition } from "@kit.ArkUI";
import { find } from "./find";
import { mine } from "./mine";
import { moment } from "./moment";
import { recommend } from "./recommend";

// 跳转页面入口函数
interface TabClass {
  text: string
  icon: ResourceStr
}
@Builder
export function layoutsBuilder() {
  layouts();
}
@ComponentV2
struct layouts {
  @Local currentindex:number=0
  pathStack: NavPathStack = new NavPathStack();
  tabData: TabClass[] = [
    {text: '推荐', icon: $r('app.media.ic_recommend')},
    {text: '发现', icon: $r('app.media.ic_find')},
    {text: '动态', icon: $r('app.media.ic_moment')},
    {text: '我的', icon: $r('app.media.ic_mine')}
  ]
  @Builder tabbuilder(item:TabClass,index:number){
    Column({space:5})
    {
      Image(item.icon)
        .width(24)
        .fillColor(this.currentindex==index ? "#E85A88":"#63AAAA")

      Text(item.text)
        .fontSize(14)
        .fontColor(this.currentindex==index ? "#E85A88":"#63AAAA")
    }

  }
  build() {
    NavDestination() {
    Tabs({barPosition:BarPosition.End})
    {ForEach(this.tabData,(item:TabClass,index:number)=>{
    TabContent() {
if(this.currentindex==0)
{
  recommend()
}
else if(this.currentindex==1)
{
  find()
}
else if(this.currentindex==2)
{
  moment()
}
else if(this.currentindex==3)
{
  mine()
}
    }
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
    .tabBar(this.tabbuilder(item,index))
    .backgroundColor("#131215")
  })

}
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
    .backgroundColor("#3B3F42")
      .onChange((index:number)=>{this.currentindex=index})
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}
