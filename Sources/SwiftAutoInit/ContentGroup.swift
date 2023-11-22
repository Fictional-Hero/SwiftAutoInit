public class ContentGroup: Resolver {
    public static var defaultGroup = ContentGroup()
    
    var factories: [FactoryWrapper] = []
    
    public init() {}

    public func setType<ProtocolType>(_ type: ProtocolType.Type, name: String = "", _ factory: @escaping (Resolver) -> ProtocolType) {
        assert(!factories.contains(where: { $0.supports(type) && $0.name == name }))

        let newFactory = GenericFactory(type, factory: { resolver in
            factory(resolver)
        })
        factories.append(FactoryWrapper(newFactory, name: name))
    }

    public func getConcrete<ProtocolType>(for type: ProtocolType.Type) -> ProtocolType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }
        return factory.getConcrete(self)
    }
    
    public func getConcrete<ProtocolType>(for type: ProtocolType.Type, name: String = "") -> ProtocolType {
        guard let factory = factories.first(where: { $0.supports(type) && $0.name == name}) else {
            fatalError("No suitable factory found")
        }
        return factory.getConcrete(self)
    }
}
