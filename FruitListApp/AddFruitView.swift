
import SwiftUI

struct AddFruitView: View {
    let save: (String) -> Void
    let cancel: () -> Void
    @State private var text = ""
    var body: some View {
        NavigationStack {
            HStack {
                Text("名前")
                TextField("", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        cancel()
                    }) {
                        Text("cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        save(text)
                    }) {
                        Text("save")
                    }
                }
            }
        }
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(save: { _ in }, cancel: {})
    }
}
