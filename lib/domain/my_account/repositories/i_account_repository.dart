import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/domain/my_account/models/account/account.dart';
import 'package:astra_curator/domain/my_account/models/account_history/account_history.dart';
import 'package:astra_curator/domain/my_account/models/withdraw/withdraw_history.dart';
import 'package:dartz/dartz.dart';

/// Describe my cashback api methods.
abstract class IAccountRepository {
  /// Get account data from server.
  Future<Either<AstraFailure, Account>> getAccountData();

  /// Get account history (cashback).
  Future<Either<AstraFailure, List<AccountHistory>>> getHistories();

  /// Get account history by period (cashback).
  Future<Either<AstraFailure, List<AccountHistory>>> getHistoriesByPeriod({
    required String beginDate,
    required String endDate,
  });
   
  /// Post query to withdraw money from account. 
  Future<Either<AstraFailure, Unit>> withdrawMoney({required double amount}); 

  /// Get account history (cashback).
  Future<Either<AstraFailure, List<WithdrawHistory>>> getWithdrawHistories();
  

}
