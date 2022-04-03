<h2><a href="https://leetcode.com/problems/shortest-distance-in-a-plane/">612. Shortest Distance in a Plane</a></h2><h3>Medium</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <code>Point2D</code></p>

<pre>+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
+-------------+------+
(x, y) is the primary key column for this table.
Each row of this table indicates the position of a point on the X-Y plane.
</pre>

<p>&nbsp;</p>

<p>The distance between two points <code>p<sub>1</sub>(x<sub>1</sub>, y<sub>1</sub>)</code> and <code>p<sub>2</sub>(x<sub>2</sub>, y<sub>2</sub>)</code> is <code>sqrt((x<sub>2</sub> - x<sub>1</sub>)<sup>2</sup> + (y<sub>2</sub> - y<sub>1</sub>)<sup>2</sup>)</code>.</p>

<p>Write an SQL query to report the shortest distance between any two points from the <code>Point2D</code> table. Round the distance to <strong>two decimal points</strong>.</p>

<p>The query result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> 
Point2D table:
+----+----+
| x  | y  |
+----+----+
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
+----+----+
<strong>Output:</strong> 
+----------+
| shortest |
+----------+
| 1.00     |
+----------+
<strong>Explanation:</strong> The shortest distance is 1.00 from point (-1, -1) to (-1, 2).
</pre>
</div>