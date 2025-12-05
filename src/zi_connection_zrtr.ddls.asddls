@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'
}

@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZI_connection_ZRTR
  as select from /dmo/connection as Connection
  association [1..*] to ZI_FLight_zrtr  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                    and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to ZI_CARRIER_ZRTR as _Carrier on  $projection.CarrierId = _Carrier.CarrierId
{
      @ObjectModel.text.association: '_Carrier'
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,
      @Search.defaultSearchElement: true
      _Flight,
      _Carrier
}
