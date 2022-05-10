public class xaHEoxzV8P8I3pCiRZDQRT41i6F6CaCP<T> {

    public var NZGIw3DUTSnNPpLEN9pDujT8jFYiW8FA: (_ oldValue: T, _ newValue: T) -> Void = { _, _ in }

    public var GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp: T {
        didSet {
            NZGIw3DUTSnNPpLEN9pDujT8jFYiW8FA(oldValue, GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp)
        }
    }
    
    public init(_ value: T) {
        self.GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp = value
    }

    public func CDk4kCHmxvPZZWeV04A4nhyHRZZzfL34(bind: @escaping ((_ oldValue: T, _ newValue: T) -> Void)) {
        self.NZGIw3DUTSnNPpLEN9pDujT8jFYiW8FA = bind
        bind(GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp, GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp)
    }

}
