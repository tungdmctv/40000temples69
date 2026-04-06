import AppKit
import Foundation
import Vision

guard CommandLine.arguments.count > 1 else {
    fputs("Usage: swift scripts/ocr.swift <image-path> [lang...]\n", stderr)
    exit(1)
}

let imagePath = CommandLine.arguments[1]
let languages = CommandLine.arguments.count > 2
    ? Array(CommandLine.arguments.dropFirst(2))
    : ["th-TH", "en-US"]

let url = URL(fileURLWithPath: imagePath)
guard let image = NSImage(contentsOf: url) else {
    fputs("Could not open image at \(imagePath)\n", stderr)
    exit(1)
}

var rect = CGRect(origin: .zero, size: image.size)
guard let cgImage = image.cgImage(forProposedRect: &rect, context: nil, hints: nil) else {
    fputs("Could not create CGImage for \(imagePath)\n", stderr)
    exit(1)
}

let request = VNRecognizeTextRequest()
request.recognitionLevel = .accurate
request.usesLanguageCorrection = true
request.recognitionLanguages = languages

let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])

do {
    try handler.perform([request])
    let results = request.results ?? []
    for observation in results {
        if let candidate = observation.topCandidates(1).first {
            print(candidate.string)
        }
    }
} catch {
    fputs("OCR failed: \(error)\n", stderr)
    exit(1)
}
