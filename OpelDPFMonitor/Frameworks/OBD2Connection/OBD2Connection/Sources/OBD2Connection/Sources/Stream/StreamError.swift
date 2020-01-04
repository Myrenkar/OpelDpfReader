import Foundation

enum WriterError: Error {
    case writeError
}

enum StreamReaderError: Error {
    case readError
    case noBytesReaded
    case ELMError
}
