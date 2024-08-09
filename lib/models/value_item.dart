import 'dart:convert';

/// [label] is the item that is displayed in the list. [value] is the value that is returned when the item is selected.
/// If the [value] is not provided, the [label] is used as the value.
/// An example of a [ValueItem] is:
/// ```dart
/// const ValueItem(label: 'Option 1', value: '1')
/// ```

class ValueItem<T> {
  /// The label of the value item
  final String label;

  /// The value of the value item
  final T? value;

  final T? secValue;

  final T? thrValue;

  /// Default constructor for [ValueItem]
  const ValueItem({
    required this.label,
    required this.value,
    this.secValue,
    this.thrValue,
  });

  /// toString method for [ValueItem]
  @override
  String toString() {
    return 'ValueItem(label: $label, value: $value, secValue: $secValue, thrValue: $thrValue)';
  }

  /// toMap method for [ValueItem]
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'secValue': secValue,
      'thrValue': thrValue,
    };
  }

  /// fromMap method for [ValueItem]
  factory ValueItem.fromMap(Map<String, dynamic> map) {
    return ValueItem<T>(
      label: map['label'] ?? '',
      value: map['value'],
      secValue: map['secValue'],
      thrValue: map['thrValue'],
    );
  }

  /// toJson method for [ValueItem]
  String toJson() => json.encode(toMap());

  /// fromJson method for [ValueItem]
  factory ValueItem.fromJson(String source) =>
      ValueItem<T>.fromMap(json.decode(source));

  /// Equality operator for [ValueItem]
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueItem<T> &&
        other.label == label &&
        other.value == value &&
        other.secValue == secValue &&
        other.thrValue == thrValue;
  }

  /// Hashcode for [ValueItem]
  @override
  int get hashCode =>
      label.hashCode ^ value.hashCode ^ secValue.hashCode ^ thrValue.hashCode;

  /// CopyWith method for [ValueItem]
  ValueItem<T> copyWith({
    String? label,
    T? value,
    T? secValue,
    T? thrValue,
  }) {
    return ValueItem<T>(
      label: label ?? this.label,
      value: value ?? this.value,
      secValue: secValue ?? this.secValue,
      thrValue: thrValue ?? this.thrValue,
    );
  }
}
