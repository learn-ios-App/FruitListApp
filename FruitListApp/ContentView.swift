
import SwiftUI

struct ContentView: View {
    @ObservedObject private var fruitData = FruitData()
    @State private var isAddView = false
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(fruitData.fruits) { fruit in
                        ListRow(fruit: fruit)
                    }
                    .onDelete(perform: fruitData.deleteFruit)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isAddView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isAddView) {
            AddFruitView(
                save: { text in
                    fruitData.fruits.append(Fruit(name: text, check: false))
                    isAddView = false
                },
                cancel: {
                    isAddView = false
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
