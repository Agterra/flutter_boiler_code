    final StreamSubscription<CustomResultState<InstallationEntity?, Exception>>
    sub = _getStreamInstallationUseCase.execute().listen((
      CustomResultState<InstallationEntity?, Exception> result,
    ) {
      result.when(
        success: (InstallationEntity? e) => <void>{print(e?.id)},
      );
    });
