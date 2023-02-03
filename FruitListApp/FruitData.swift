
import Foundation

class FruitData: ObservableObject {
    @Published var fruits = [
        Fruit(name: "リンゴ", check: true),
        Fruit(name: "バナナ", check: false),
        Fruit(name: "パイナップル", check: false),
        Fruit(name: "ミカン", check: true)
    ]
    func deleteFruit(offsets: IndexSet) {
        self.fruits.remove(atOffsets: offsets)
        print("deleteが呼ばれました")
    }
}
