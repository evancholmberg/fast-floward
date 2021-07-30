import Artist from "./contract.cdc"

// Print a Picture and store it in the authorizing account's Picture Collection.
transaction(width: UInt8, height: UInt8, pixels: String) {
    prepare(account: AuthAccount) {
    let printerRef = getAccount(0x01cf0e2f2f715450)
        .getCapability<&Artist.Printer>(/public/ArtistPicturePrinter)
        .borrow()
        ?? panic("Couldn't borrow printer reference.")
    
    let collectionRef = getAccount(0x01cf0e2f2f715450)
        .getCapability<&Artist.Collection>(/public/ArtistPictureCollection)
        .borrow()
        ?? panic("Couldn't borrow collection reference.")

    let canvas = Artist.Canvas(
        width: width,
        height: height,
        pixels: pixels
    )
    let picture <- printerRef.print(canvas: canvas)
    collectionRef.deposit(picture: <- picture!)

    }
}