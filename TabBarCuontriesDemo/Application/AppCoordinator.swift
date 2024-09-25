import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = UIColor.black.withAlphaComponent(0.25)
        
        let config = CountriesNetworkConfig()
        let networkService = NetworkService(config: config)
        let repository = CountriesRepository(networkService: networkService)
        let viewModel = HomeViewModel(repository: repository)
        let viewController = HomeController(viewModel: viewModel)
        
        tabBarController.viewControllers = [
            setupTabViewController(title: "Home", iconSystemName: "house", backGroundColor: .white, viewController: viewController),
            setupTabViewController(title: "Files", iconSystemName: "folder", backGroundColor: .blue),
            setupTabViewController(title: "Message", iconSystemName: "paperplane", backGroundColor: .green),
            setupTabViewController(title: "Archive", iconSystemName: "archivebox", backGroundColor: .red),
            setupTabViewController(title: "Documents", iconSystemName: "doc.text", backGroundColor: .orange)
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private func setupTabViewController(
        title: String,
        iconSystemName: String,
        backGroundColor: UIColor,
        viewController: UIViewController = UIViewController()
    ) -> UIViewController {
        viewController.view.backgroundColor = backGroundColor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: iconSystemName),
            tag: 0
        )
        
        return viewController
    }
}

