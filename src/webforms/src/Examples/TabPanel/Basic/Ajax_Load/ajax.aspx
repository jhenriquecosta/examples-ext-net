<%@ Page Language="C#" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
    }
</script>

<style>
    div.sourcecode {
        margin  : 12px 0;
        font    : normal 12px monospace;
        padding : 1em 1.5em;
        border  : 1px solid #2f6fab;
        color   : #3f747f;
        border-left      : 4px solid #2f6fab;
        background-color : #f9f9f9;
        overflow-y : hidden;
        overflow-x : auto;
    }
</style>

<div>
    <p>I am content loaded via Ajax. I was purposely delayed 2 seconds so you could see the Ajax loading indicator.</p>

    <div class="sourcecode">
        <div style="font-family: Courier New; font-size: 10pt; color: black;">
        <pre style="margin: 0px;"><span style="color: blue;">&lt;</span><span style="color: #a31515;">script</span> <span style="color: red;">runat</span><span style="color: blue;">="server"&gt;</span></pre>
        <pre style="margin: 0px;">&nbsp;&nbsp;&nbsp; <span style="color: blue;">protected</span> <span style="color: blue;">void</span> Page_Load(<span style="color: blue;">object</span> sender, <span style="color: #2b91af;">EventArgs</span> e)</pre>
        <pre style="margin: 0px;">&nbsp;&nbsp;&nbsp; {</pre>
        <pre style="margin: 0px;">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; System.Threading.<span style="color: #2b91af;">Thread</span>.Sleep(2000);</pre>
        <pre style="margin: 0px;">&nbsp;&nbsp;&nbsp; }</pre>
        <pre style="margin: 0px;"><span style="color: blue;">&lt;/</span><span style="color: #a31515;">script</span><span style="color: blue;">&gt;</span></pre>
        </div>
    </div>

    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure.</p>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure.</p>
</div>