#include "btree.h"

t_node		*btree_node_insert(t_btree *btree, void *data,
				   t_from side_cur, t_from side_new)
{
  t_node	*new;
  
  if (btree == NULL)
    return (NULL);
  if (btree->current == NULL ||
      (side_cur == LEFT && btree->current->left == NULL) ||
      (side_cur == RIGHT && btree->current->right == NULL) ||
      (side_cur == DAD && btree->current->dad == NULL))
    return (btree_node_add(btree, data, side_cur, side_new));
  new = btree_node_add(btree, data, side_cur, side_new);
  btree_move(btree, side_cur);
  btree_node_add_link(btree, new, side_cur, side_new);
  if (btree->current->from == FROM_LEFT)
    btree_move(btree, LEFT);
  else if (btree->current->from == FROM_RIGHT)
    btree_move(btree, RIGHT);
  else
    btree_move(btree, DAD);
  return (new);
}
