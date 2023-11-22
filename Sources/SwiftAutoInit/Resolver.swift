public protocol Resolver {
    func getConcrete<ProtocolType>(for type: ProtocolType.Type) -> ProtocolType
    func getConcrete<ProtocolType>(for type: ProtocolType.Type, name: String) -> ProtocolType
}
