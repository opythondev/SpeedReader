//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var assembly: Container?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        assembly = Container()
        guard let assembly = assembly else { return }
        
        let router = assembly.router
        router.initialViewController()
        
        window?.rootViewController = assembly.navigationController
        window?.makeKeyAndVisible()
    }
}

