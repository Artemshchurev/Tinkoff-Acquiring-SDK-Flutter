import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'submit_3ds_authorization_response.g.dart';

/// Ответ от сервера на прохождение 3-D Secure
///
/// При успешном результате прохождения 3-D Secure подтверждает инициированный платеж.
///
/// [Submit3DSAuthorizationResponse](https://oplata.tinkoff.ru/develop/api/payments/Submit3DSAuthorization-response/)
@JsonSerializable()
class Submit3DSAuthorizationResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на прохождение 3-D Secure
  Submit3DSAuthorizationResponse({
    Status status,
    bool success,
    String errorCode,
    String message,
    String details,
    this.terminalKey,
    this.amount,
    this.orderId,
    this.paymentId,
    this.rebillId,
    this.cardId,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory Submit3DSAuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$Submit3DSAuthorizationResponseFromJson(json);

  @override
  String toString() {
    return 'Submit3DSAuthorizationResponse(terminalKey: $terminalKey, orderId: $orderId, success: $success, status: $status, amount: $amount, paymentId: $paymentId, errorCode: $errorCode, message: $message, details: $details, rebillId: $rebillId, cardId: $cardId)';
  }

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$Submit3DSAuthorizationResponseToJson(this);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Сумма в копейках
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String paymentId;

  /// Идентификатор рекуррентного платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final int rebillId;

  /// Идентификатор карты в системе банка. Передается только для сохраненной карты
  @JsonKey(name: JsonKeys.cardId)
  final String cardId;
}