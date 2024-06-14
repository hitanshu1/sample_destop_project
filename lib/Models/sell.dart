
/// sell of the store model
class SellModel{
  /// invoice , customer name , status  and date of the sell
  String? invoiceID,customerName,status,date;
  /// amount of the sell
  double?amount;
  /// constructor of SellModel
  SellModel({this.amount,this.customerName,this.date,this.invoiceID,this.status});
}
