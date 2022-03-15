import 'dart:convert';

import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/domain/my_account/models/account/account.dart';
import 'package:astra_curator/domain/my_account/models/account_history/account_history.dart';
import 'package:astra_curator/domain/my_account/models/withdraw/withdraw_history.dart';
import 'package:astra_curator/domain/my_account/repositories/i_account_repository.dart';
import 'package:astra_curator/infrastructure/core/http/endpoints.dart';
import 'package:astra_curator/infrastructure/core/http/make_request.dart';
import 'package:astra_curator/infrastructure/my_account/DTOs/account_DTO/account_dto.dart';
import 'package:astra_curator/infrastructure/my_account/DTOs/account_history_DTO/account_history_DTO.dart';
import 'package:astra_curator/infrastructure/my_account/DTOs/withdraw_DTO/withdraw_history_DTO.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Service of account (cashback) api methods.
@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  const AccountRepository(this._dio);

  /// Instance ot the dio client.
  final Dio _dio;

  /// Fetch account (cashback).
  @override
  Future<Either<AstraFailure, Account>> getAccountData() async {
    return makeRequest<Account>(
      () async {
        final response = await _dio.get(Endpoints.account.cashback as String);

        final account =
            AccountDTO.fromJson(response.data as Map<String, dynamic>)
                .toDomain();

        return account;
      },
    );
  }

  /// Fetch account histories.
  @override
  Future<Either<AstraFailure, List<AccountHistory>>> getHistories() {
    return makeRequest<List<AccountHistory>>(
      () async {
        final response =
            await _dio.get(Endpoints.account.cashbackHistory as String);

        List<AccountHistory> accountList = [];

        for (final item in response.data) {
          final AccountHistory _history =
              AccountHistoryDTO.fromJson(item as Map<String, dynamic>)
                  .toAccountHistory();
          accountList.add(_history);
        }

        return accountList;
      },
    );
  }

  /// Fetch account histories by period.
  @override
  Future<Either<AstraFailure, List<AccountHistory>>> getHistoriesByPeriod({
    required String beginDate,
    required String endDate,
  }) {
    return makeRequest<List<AccountHistory>>(
      () async {
        final response = await _dio.get(
            Endpoints.account.historyByPeriod(beginDate, endDate) as String);
        List<AccountHistory> accountList = [];

        for (final item in response.data) {
          final AccountHistory _history =
              AccountHistoryDTO.fromJson(item as Map<String, dynamic>)
                  .toAccountHistory();
          accountList.add(_history);
        }

        return accountList;
      },
    );
  }

  @override
  Future<Either<AstraFailure, Unit>> withdrawMoney({required double amount}) {
    return makeRequest<Unit>(
      () async {
        String _json = json.encode(
          {
            "amount": amount,
          },
        );
        final response = await _dio.post(
          Endpoints.account.withdraw as String,
          data: _json,
        );

        return response.data;
      },
    );
  }

  @override
  Future<Either<AstraFailure, List<WithdrawHistory>>> getWithdrawHistories() {
    return makeRequest<List<WithdrawHistory>>(
      () async {
        final response =
            await _dio.get(Endpoints.account.withdrawHistory as String);

        final List<WithdrawHistory> withdrawHistoryList = [];

        for (final item in response.data) {
          final WithdrawHistory _history =
              WithdrawHistoryDTO.fromJson(item as Map<String, dynamic>)
                  .toWithdrawHistory();
          withdrawHistoryList.add(_history);
        }

        return withdrawHistoryList;
      },
    );
  }
}
