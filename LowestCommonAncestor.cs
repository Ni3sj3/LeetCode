/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public TreeNode LowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if(root.val == p.val || root.val == q.val)
            return root;
        
        bool goLeft = false;
        bool goRight = false;
        
        if(root.left.val < root.val){
            if(p.val < root.val || q.val < root.val){
                goLeft = true;}
            if(p.val > root.val || q.val > root.val){
                goRight = true;
            }
        }
        
        if(root.right.val < root.val){
            if(p.val < root.val || q.val < root.val){
                goRight = true;}
            if(p.val > root.val || q.val > root.val){
                goLeft = true;
            }
        }
            
        if(goLeft && goRight)
            return root;
        
        if(goLeft)
            return LowestCommonAncestor(root.left,p,q);
            
        if(goRight)
            return LowestCommonAncestor(root.right,p,q);
            
        return root;
    }
}