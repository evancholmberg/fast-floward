import LocalArtist from "../contract.cdc"

transaction(width: Int, height: Int, pixels: String) {
  
  let picture: @LocalArtist.Picture?
  let collectionRef: &{LocalArtist.PictureReceiver}

  prepare(account: AuthAccount) {
    // Change to your contract account address.
    let printerRef = getAccount(0x5a7ac983af957eb9)
      .getCapability<&LocalArtist.Printer>(/public/LocalArtistPicturePrinter)
      .borrow()
      ?? panic("Couldn't borrow printer reference.")
      
    self.picture <- printerRef.print(
      width: width,
      height: height,
      pixels: pixels
    )
    self.collectionRef = account
      .getCapability<&{LocalArtist.PictureReceiver}>(/public/LocalArtistPictureReceiver)
      .borrow()
      ?? panic("Couldn't borrow picture receiver reference.")
  }
  execute {
    if self.picture == nil {
      destroy self.picture
    } else {
      self.collectionRef.deposit(picture: <- self.picture!)
    }
  }
}