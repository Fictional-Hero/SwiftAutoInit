protocol ServiceFactory {
    associatedtype ProtocolType
    func getFactory(_ resolver: Resolver) -> ProtocolType
}

final class FactoryWrapper {
    private let resolve: (Resolver) -> Any
    private let supports: (Any.Type) -> Bool
    let name: String

    init<T: ServiceFactory>(_ serviceFactory: T, name: String) {
        self.name = name
        self.resolve = { resolver -> Any in
            serviceFactory.getFactory(resolver)
        }
        self.supports = { $0 == T.ProtocolType.self }
    }

    func getConcrete<ProtocolType>(_ resolver: Resolver) -> ProtocolType {
        return resolve(resolver) as! ProtocolType
    }

    func supports<ProtocolType>(_ type: ProtocolType.Type) -> Bool {
        return supports(type)
    }
}


struct GenericFactory<ProtocolType>: ServiceFactory {
    private let factory: (Resolver) -> ProtocolType

    init(_ type: ProtocolType.Type, factory: @escaping (Resolver) -> ProtocolType) {
        self.factory = factory
    }

    func getFactory(_ resolver: Resolver) -> ProtocolType {
        return factory(resolver)
    }
}
