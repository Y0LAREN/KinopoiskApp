import Foundation
import UIKit

class TapBarController: UITabBarController{
  
  override func viewDidLoad() {
    super.viewDidLoad()
    generateTapBar()
  }
  
  private func generateTapBar(){
    viewControllers = [
    generateVC(viewController: SearchFilmsViewController(),
               title: "Search",
               image: UIImage(systemName: "magnifyingglass")),
    generateVC(viewController: ListOfAllUsersViewController(),
               title: "Profile",
               image: UIImage(systemName: "person.fill"))]
  }
  
  private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
    viewController.tabBarItem.title = title
    viewController.tabBarItem.image = image
    return viewController
  }
  
}
