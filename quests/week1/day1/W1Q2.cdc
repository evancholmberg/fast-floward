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
    let pixels2 = [
    "*   *",
    " *   ",
    "  *  ",
    "   * ",
    "*   *"
  ]
  let canvas2 = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixels2)
  )
    let pixels3 = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
  ]
  let canvas3 = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixels3)
  )
    let pixels4 = [
    "*   *",
    " *   ",
    "  *  ",
    "   * ",
    "*   *"
  ]
  let canvas4 = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixels4)
  )
    let pixels5 = [
    "*   *",
    " * * ",
    "     ",
    " * * ",
    "     "
  ]
  let canvas5 = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixels5)
  )

  log(canvas1.pixels)
  log(canvas2.pixels)
  log(canvas3.pixels)
  log(canvas4.pixels)
  log(canvas5.pixels)
  let myPrinter <- create Printer()
  let picture1 <- myPrinter.print(canvas: canvas1)
  let picture2 <- myPrinter.print(canvas: canvas2)
  let picture3 <- myPrinter.print(canvas: canvas3)
  let picture4 <- myPrinter.print(canvas: canvas4)
  let picture5 <- myPrinter.print(canvas: canvas5)

  // Log the type of the pictures to show that some are nil
  log(picture1.getType())
  log(picture2.getType())
  log(picture3.getType())
  log(picture4.getType())
  log(picture5.getType())

  // Destroy resources
  destroy picture1
  destroy picture2
  destroy picture3
  destroy picture4
  destroy picture5
  destroy myPrinter
}

pub resource Printer {
    // Array of strings of canvas pixels
    pub var printedCanvases: [String]

    init() {
        self.printedCanvases = []
    }

    pub fun print(canvas: Canvas): @Picture? {
        if (self.printedCanvases.contains(canvas.pixels)) {
            return nil
        }

        self.printedCanvases.append(canvas.pixels)
        return <- create Picture(canvas: canvas)
    }


}
