import Artist5 from 0x05

transaction() {
  let pictureCollection: &Artist5.Collection

  prepare(account: AuthAccount) {
    let printerRef = getAccount(0x05)
      .getCapability<&Artist5.Printer>(/public/ArtistPicturePrinter)
      .borrow()
      ?? panic("Couldn't borrow printer reference.")
    
    let collectionRef = getAccount(0x05)
      .getCapability<&Artist5.Collection>(/public/ArtistPictureCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference.")

    // Replace with your own drawings.
    self.pictureCollection = collectionRef
    let canvas = Artist5.Canvas(
      width: printerRef.width,
      height: printerRef.height,
      pixels: "*   * * *   *   * * *   *"
    )
    let canvas2 = Artist5.Canvas(
      width: printerRef.width,
      height: printerRef.height,
      pixels: "*   * *     *     * *   *"
    )
    let canvas3 = Artist5.Canvas(
      width: printerRef.width,
      height: printerRef.height,
      pixels: "*   * * *       * *      "
    )
    collectionRef.deposit(picture: <- printerRef.print(canvas: canvas)!)
    log("HERE")
    collectionRef.deposit(picture: <- printerRef.print(canvas: canvas2)!)
    collectionRef.deposit(picture: <- printerRef.print(canvas: canvas3)!)
  }

  execute {
    if (1 > 2) {
      log("Picture with already exists!")
    } else {
      log("Picture printed!")
    }

  }
}
