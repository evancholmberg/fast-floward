import Artist from "./contract.cdc"

// Return an array of formatted Pictures that exist in the account with the a specific address.
// Return nil if that account doesn't have a Picture Collection.
pub fun main(address: Address): [String]? {
    let collectionRef = getAccount(address).getCapability<&Artist.Collection>(/public/ArtistPictureCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference.")

    var buffer: [String] = []
    for canvas in collectionRef.getCanvases() {
        buffer.append(canvas.pixels)
    }

    return buffer

}