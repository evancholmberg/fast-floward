pub struct Canvas {

  pub let width: UInt8
  pub let height: UInt8
  pub let pixels: String

  init(width: UInt8, height: UInt8, pixels: String) {
    self.width = width
    self.height = height
    // The following pixels
    // 123
    // 456
    // 789
    // should be serialized as
    // 123456789
    self.pixels = pixels
  }
}

pub fun serializeStringArray(_ lines: [String]): String {
  var buffer = ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}

pub resource Picture {
  pub let canvas: Canvas
  
  init(canvas: Canvas) {
    self.canvas = canvas
  }
}


pub fun main() {
  let pixels1 = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
  ]
  let canvas1 = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixels1)
  )

  let letterX <- create Picture(canvas: canvas1)
  display(canvas: letterX.canvas)
  destroy letterX

}

pub fun display(canvas: Canvas) {
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
