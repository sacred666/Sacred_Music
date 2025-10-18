@Entry
@Component
struct Index {
  pathStack : NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack){
    }.onAppear(() => {
      this.pathStack.pushPathByName("starts", null, false);
    })
    .hideNavBar(true)
  }
}
