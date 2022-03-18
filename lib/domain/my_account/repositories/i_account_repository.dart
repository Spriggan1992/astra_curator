import 'package:astra_curator/domain/core/failure/failure.dart';
import 'package:astra_curator/domain/my_account/models/account/account.dart';
import 'package:astra_curator/domain/my_account/models/account_history/account_history.dart';
import 'package:astra_curator/domain/my_account/models/withdraw/withdraw_history.dart';
import 'package:dartz/dartz.dart';

/// Describe my cashback api methods.
abstract class IAccountRepository {
  /// Get account data from server.
  Future<Either<Failure, Account>> getAccountData();

  /// Get account history (cashback).
  Future<Either<Failure, List<AccountHistory>>> getHistories();

  /// Get account history by period (cashback).
  Future<Either<Failure, List<AccountHistory>>> getHistoriesByPeriod({
    required String beginDate,
    required String endDate,
  });

  /// Post query to withdraw money from account.
  Future<Either<Failure, Unit>> withdrawMoney({required double amount});

  /// Get account history (cashback).
  Future<Either<Failure, List<WithdrawHistory>>> getWithdrawHistories();
}
