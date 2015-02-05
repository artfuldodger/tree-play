class Seeds
  CONFIG = {
    name: 'Home',
    level: 0,
    position: 0,

    children: [
      {
        name: 'A',
        level: 1,
        position: 0,
        children: [
          {
            name: 'D',
            level: 2,
            position: 0,
            children: [
              {
                name: 'M',
                level: 3,
                position: 0
              },
              {
                name: 'N',
                level: 3,
                position: 1
              },
              {
                name: 'O',
                level: 3,
                position: 2
              }
            ]
          },
          {
            name: 'E',
            level: 2,
            position: 1,
            children: [
              {
                name: 'P',
                level: 3,
                position: 0
              },
              {
                name: 'Q',
                level: 3,
                position: 1
              },
              {
                name: 'R',
                level: 3,
                position: 2
              }
            ]
          },
          {
            name: 'F',
            level: 2,
            position: 2,
            children: [
              {
                name: 'S',
                level: 3,
                position: 0
              },
              {
                name: 'T',
                level: 3,
                position: 1
              },
              {
                name: 'U',
                level: 3,
                position: 2
              }
            ]
          }
        ]
      },
      {
        name: 'B',
        level: 1,
        position: 1,
        children: [
          {
            name: 'G',
            level: 2,
            position: 0,
            children: [
              {
                name: 'V',
                level: 3,
                position: 0
              },
              {
                name: 'W',
                level: 3,
                position: 1
              },
              {
                name: 'X',
                level: 3,
                position: 2
              }
            ]
          },
          {
            name: 'H',
            level: 2,
            position: 1,
          },
          {
            name: 'I',
            level: 2,
            position: 2,
          }
        ]
      },
      {
        name: 'C',
        level: 1,
        position: 2,
        children: [
          {
            name: 'J',
            level: 2,
            position: 0,
          },
          {
            name: 'K',
            level: 2,
            position: 1,
          },
          {
            name: 'L',
            level: 2,
            position: 2,
          }
        ]
      }
    ]
  }

  def self.load
    create_node(CONFIG)
  end

  def self.create_node(node_config, parent = nil)
    node = Node.where(name: node_config[:name]).first_or_create
    node.update_attributes(
      level:     node_config[:level],
      position:  node_config[:position],
      parent_id: parent.try(:id)
    )

    (node_config[:children] || []).each do |child|
      create_node(child, node)
    end
  end
end
