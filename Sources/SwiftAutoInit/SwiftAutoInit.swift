import UIKit

public func autoInit<A, Z>(_ initialise: (A) -> Z, container: ContentGroup = ContentGroup.defaultGroup) -> Z {
    return initialise(container.getConcrete(for: A.self))
}
public func autoInit<A, B, Z>(_ initialise: (A, B) -> Z, container: ContentGroup = ContentGroup.defaultGroup) -> Z {
    return initialise(container.getConcrete(for: A.self),
                      container.getConcrete(for: B.self))
}
public func autoInit<A, B, C, Z>(_ initialise: (A, B, C) -> Z, container: ContentGroup = ContentGroup.defaultGroup) -> Z {
    return initialise(container.getConcrete(for: A.self),
                      container.getConcrete(for: B.self),
                      container.getConcrete(for: C.self))
}
public func autoInit<A, B, C, D, Z>(_ initialise: (A, B, C, D) -> Z, container: ContentGroup = ContentGroup.defaultGroup) -> Z {
    return initialise(container.getConcrete(for: A.self),
                      container.getConcrete(for: B.self),
                      container.getConcrete(for: C.self),
                      container.getConcrete(for: D.self))
}
public func autoInit<A, B, C, D, E, Z>(_ initialise: (A, B, C, D, E) -> Z, container: ContentGroup = ContentGroup.defaultGroup) -> Z {
    return initialise(container.getConcrete(for: A.self),
                      container.getConcrete(for: B.self),
                      container.getConcrete(for: C.self),
                      container.getConcrete(for: D.self),
                      container.getConcrete(for: E.self))
}
public func autoInit<A, B, C, D, E, F, Z>(_ initialise: (A, B, C, D, E, F) -> Z, container: ContentGroup = ContentGroup.defaultGroup) -> Z {
    return initialise(container.getConcrete(for: A.self),
                      container.getConcrete(for: B.self),
                      container.getConcrete(for: C.self),
                      container.getConcrete(for: D.self),
                      container.getConcrete(for: E.self),
                      container.getConcrete(for: F.self))
}
