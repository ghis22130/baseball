//
//  BaseballSceneDIContainer.swift
//  Baseball
//
//  Created by Jun Ho JANG on 2021/05/11.
//

import UIKit

class BaseballSceneDIContainer: BaseballFlowCoordinatorDependencies {
    private var dependencies: Dependencies
    
    struct Dependencies {
        let apiNetwork: NetworkService
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    //MARK: - GameListView
    private func makeGameListRepository() -> GameListRepository {
        return DefaultGameListRepository(networkService: dependencies.apiNetwork)
    }
    
    private func makeFetchGameListUseCase() -> FetchGameListUseCase {
        return DefaultFetchGameListUseCase(gameListRepository: makeGameListRepository())
    }
    
    private func makeGameListViewModel(action: GameListViewModelAction) -> GameListViewModel {
        return GameListViewModel(fetchGameListUseCase: makeFetchGameListUseCase(), action: action)
    }
    
    func makeGameListViewController(action: GameListViewModelAction) -> GameListViewController {
        return GameListViewController.create(with: makeGameListViewModel(action: action))
    }
    
    //MARK: - GamePlayView
    private func makeGamePlayRepository() -> GamePlayRepository {
        return DefaultGamePlayRepository(networkService: dependencies.apiNetwork)
    }
    
    private func makeFetchGamePlayUseCase() -> FetchGamePlayUseCase {
        return DefaultFetchGamePlayUseCase(gamePlayRepository: makeGamePlayRepository())
    }
    
    private func makeGamePlayViewModel(matchId: Int) -> GamePlayViewModel {
        return GamePlayViewModel(matchId: matchId, fetchGamePlayUseCase: makeFetchGamePlayUseCase())
    }
    
    func makeGamePlayViewController(matchId: Int) -> GamePlayViewController {
        return GamePlayViewController.create(with: makeGamePlayViewModel(matchId: matchId))
    }
    
    //MARK: - GameScoreView
    private func makePlayerRecordRepository() -> PlayerRecordRepository {
        return DefaultPlayerRecordRepository(networkService: dependencies.apiNetwork)
    }
    
    private func makeFetchPlayerRecordsUseCase() -> FetchPlayerRecordsUseCase {
        return DefaultFetchPlayerRecordsUseCase(playerRecordRepository: makePlayerRecordRepository())
        
    }
    private func makeGameScoreViewModel(homeTeam: String, awayTeam: String) -> GameScoreViewModel {
        return GameScoreViewModel(homeTeam: homeTeam, awayTeam: awayTeam, fetchPlayerRecordsUseCase: makeFetchPlayerRecordsUseCase())
    }
    func makeGameScoreViewController(homeTeam: String, awayTeam: String) -> GameScoreViewController {
        return GameScoreViewController.create(with: makeGameScoreViewModel(homeTeam: homeTeam, awayTeam: awayTeam))
    }
    //MARK: - Coordinator
    func makeBaseballSceneCoordinator(navigationController: UINavigationController) -> BaseballSceneFlowCoordinator {
        return BaseballSceneFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
