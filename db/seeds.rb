InventoryItem.create!([
                        { name: "Burger", quantity: 50, threshold: 10 },
                        { name: "Pizza", quantity: 30, threshold: 5 },
                        { name: "Coke", quantity: 100, threshold: 20 },
                        { name: "Fries", quantity: 40, threshold: 10 }
                      ])

puts "✅ Inventory seeded successfully!"