import 'dart:convert';

import 'package:astra_curator/account/domain/models/account/account.dart';
import 'package:astra_curator/account/domain/models/account_history/account_history.dart';
import 'package:astra_curator/account/domain/models/withdraw/withdraw_history.dart';
import 'package:astra_curator/account/domain/repositories/i_account_repository.dart';
import 'package:astra_curator/account/infrastructure/DTOs/account_DTO/account_dto.dart';
import 'package:astra_curator/account/infrastructure/DTOs/account_history_DTO/account_history_DTO.dart';
import 'package:astra_curator/account/infrastructure/DTOs/withdraw_DTO/withdraw_history_DTO.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/infrastructure/http/api_client.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:astra_curator/core/infrastructure/http/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Service of account (cashback) api methods.
@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  /// Instance ot the dio client.
  final ApiClient _client;

  const AccountRepository(this._client);

  /// Fetch account (cashback).
  @override
  Future<Either<Failure, Account>> getAccountData() async {
    return _client.get(
      Endpoints.account.cashback,
      responseParser: (response) =>
          AccountDTO.fromJson(response.data as Map<String, dynamic>).toDomain(),
    );
  }

  /// Fetch account histories.
  @override
  Future<Either<Failure, List<AccountHistory>>> getHistories() {
    return _client.get(
      Endpoints.account.cashbackHistory,
      responseParser: (response) => (response.data as List<dynamic>)
          .map(
            (e) => AccountHistoryDTO.fromJson(e as Map<String, dynamic>)
                .toAccountHistory(),
          )
          .toList(),
    );
  }

  /// Fetch account histories by period.
  @override
  Future<Either<Failure, List<AccountHistory>>> getHistoriesByPeriod({
    required String beginDate,
    required String endDate,
  }) {
    return _client.get(
      Endpoints.account.historyByPeriod(beginDate, endDate),
      responseParser: (response) => (response.data as List<dynamic>)
          .map(
            (e) => AccountHistoryDTO.fromJson(e as Map<String, dynamic>)
                .toAccountHistory(),
          )
          .toList(),
    );
  }

  @override
  Future<Either<Failure, Unit>> withdrawMoney({required double amount}) {
    return makeRequest<Unit>(
      () async {
        final String _json = json.encode(
          {
            "amount": amount,
          },
        );
        return _client.post(
          Endpoints.account.withdraw,
          data: _json,
          responseParser: (response) => unit,
        );
      },
    );
  }

  @override
  Future<Either<Failure, List<WithdrawHistory>>> getWithdrawHistories() {
    return _client.get(
      Endpoints.account.withdrawHistory,
      responseParser: (response) =>
          (response.data as List<Map<String, dynamic>>)
              .map((e) => WithdrawHistoryDTO.fromJson(e).toWithdrawHistory())
              .toList(),
    );
  }
}
