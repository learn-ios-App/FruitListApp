
import SwiftUI

struct EditView: View {
    let edit: (String) -> Void
    let cancel: () -> Void
    @State var text: String
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
                        edit(text)
                    }) {
                        Text("save")
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(edit: { _ in }, cancel: {}, text: "リンゴ")
    }
}
