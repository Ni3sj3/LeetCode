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
    public TreeNode InvertTree(TreeNode root) {
        if(root == null) return root;
        
        TreeNode holdNode = root.left;
        root.left = root.right;
        root.right = holdNode;
        InvertTree(root.left);
        InvertTree(root.right);
        return root;
    }
}