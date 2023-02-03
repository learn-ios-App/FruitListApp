
import SwiftUI

struct ListRow: View {
    @State var fruit: Fruit
    @State private var isEditView = false
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    fruit.check.toggle()
                }) {
                    Image(
                        systemName: fruit.check
                        ? "checkmark.circle"
                        : "circle"
                    )
                    .foregroundColor(.black)
                }
                Text(fruit.name)
            }
            Spacer()
            Button(action: {
                isEditView = true
            }) {
                Image(systemName: "i.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .sheet(isPresented: $isEditView) {
            EditView(
                edit: { text in
                    fruit.name = text
                    isEditView = false
                },
                cancel: {
                    isEditView = false
                },
                text: fruit.name)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(fruit: Fruit(name: "リンゴ", check: true))
    }
}
