import Artist from 0x01
import Artist2 from 0x02
import Artist3 from 0x03
import Artist4 from 0x04
import Artist5 from 0x05

pub fun display(canvas: Artist.Canvas) {
    // Top of frame
    log("+-----+")
    let border = "|"
    var beginning = 0
    var width = Int(canvas.width)
    var height = Int(canvas.height)
    var i = 0
    while i < height {
        log(border.concat(canvas.pixels.slice(from: beginning, upTo: width)).concat(border))
        i = i + 1
        width = width + Int(canvas.width)
        beginning = beginning + Int(canvas.width)
    }
    // Bottom of frame
    log("+-----+")
}

pub fun main() {

  let artistPictureCollection = getAccount(0x01)
  .getCapability<&Artist.Collection>(/public/ArtistPictureCollection)
  .borrow() 
  ?? panic("Could not find picture collection!")

  let artist2PictureCollection = getAccount(0x02)
  .getCapability<&Artist2.Collection>(/public/ArtistPictureCollection)
  .borrow()
  ?? panic("Could not find picture collection!")

  let artist3PictureCollection = getAccount(0x03)
  .getCapability<&Artist3.Collection>(/public/ArtistPictureCollection)
  .borrow() 
  ?? panic("Could not find picture collection!")

  let artist4PictureCollection = getAccount(0x04)
  .getCapability<&Artist4.Collection>(/public/ArtistPictureCollection)
  .borrow() 
  ?? panic("Could not find picture collection!")

  let artist5PictureCollection = getAccount(0x05)
  .getCapability<&Artist5.Collection>(/public/ArtistPictureCollection)
  .borrow() 
  ?? panic("Could not find picture collection!")

  var i = 0
  while artistPictureCollection.canvasCollection.length > i {
    display(canvas: artistPictureCollection.canvasCollection[i].canvas)
    i = i + 1
  }

  i = 0
  while artist2PictureCollection.canvasCollection.length > i {
    display(canvas: artistPictureCollection.canvasCollection[i].canvas)
    i = i + 1
  }

  i = 0
  while artist3PictureCollection.canvasCollection.length > i {
    display(canvas: artistPictureCollection.canvasCollection[i].canvas)
    i = i + 1
  }

  i = 0
  while artist4PictureCollection.canvasCollection.length > i {
    display(canvas: artistPictureCollection.canvasCollection[i].canvas)
    i = i + 1
  }

  i = 0
  while artist5PictureCollection.canvasCollection.length > i {
    display(canvas: artistPictureCollection.canvasCollection[i].canvas)
    i = i + 1
  }




}
